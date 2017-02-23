class User < ApplicationRecord
  has_secure_password
  has_many :my_cards
  has_many :cards, through: :my_cards

  has_many :game_participations
  has_many :games, through: :game_participations

  has_many :images, as: :imageable_type

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
    card.update(status: "in hand")
  end

  def participation_with(game_object)
    game_participations.where(game_id: game_object.id).first
  end

end

