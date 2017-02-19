class MyCardsController < ApplicationController

  def index
    @my_cards = current_user.cards
  end

  def show
  end
end
