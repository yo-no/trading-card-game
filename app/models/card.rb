class Card < ApplicationRecord
  has_many :my_cards
  has_many :users, through: :my_cards
  # has_many :images, as: :imageable_type

  has_attached_file :image, 
  styles: {large: "357x500>", medium: "214x300>", small: "143x200"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def medium_image_url
        image.url(:medium)
  end

  def large_image_url
        image.url(:large)
   end



end
