class Card < ApplicationRecord
  has_many :my_cards
  has_many :users, through: :my_cards
  has_many :images, as: :imageable_type

end
