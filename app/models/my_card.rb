class MyCard < ApplicationRecord
  belongs_to :user
  belongs_to :card

  def cost
    card.cost
  end

  def attack
    card.attack
  end

end
