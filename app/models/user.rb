class User < ApplicationRecord
  has_secure_password
  has_many :my_cards
  has_many :cards, through: :my_cards

  has_many :game_participations
  has_many :games, through: :game_participations

  has_many :images, as: :imageable_type

  has_attached_file :avatar, styles: { large: "400x400#", big:"300x300#", medium: "200x200#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def initialize_deck
    # my_cards.each do |card|
    #   if card.deck == true
    #     card.status = "in deck"
    #     card.save
    #   end
    # end
    my_cards.where(deck: true).update_all(status: "in deck")
  end

  def deck
    my_cards.where(deck: true, status: "in deck")
  end

  def hand
     my_cards.where(deck: true, status: "in hand")
  end

  def draw_card
    card = deck.sample
    if card
      card.update(status: "in hand")
    end
  end

  def participation_with(game_object)
    game_participations.where(game_id: game_object.id).first
  end

  def mana_slots
    game_participations.mana_slots
  end

 private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def user_params
  params.require(:user).permit(:avatar, :name, :email, :password, :password_confirmation)
end

end

