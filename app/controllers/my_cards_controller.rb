class MyCardsController < ApplicationController

  def index
    @my_cards = []
    current_user.cards.each do |my_card|
      if @my_cards.index(my_card) == nil
        @my_cards << my_card
      end
    end
    @cardback = Card.find_by(name: "back")
  end

  def show
  end
end
