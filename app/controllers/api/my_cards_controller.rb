class Api::MyCardsController < ApplicationController

  def index
    @my_cards = MyCard.all
  end

  def show
  end
end
