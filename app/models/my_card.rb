class MyCard < ApplicationRecord
  belongs_to :user
  belongs_to :card

  def cost
    card.cost
  end

  def attack
    card.attack
  end

  def name
    card.name
  end

  def discard
    update(status: "graveyard")
  end

end
