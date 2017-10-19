class CardsController < ApplicationController
  def index
    @opponent = User.find_by(name: "default")
    @cardback = Card.find_by(name: "back")
    @cards = Card.all
  end

  def attack
    @cards = Card.all
    @cardback = Card.find_by(name: "back")
    @opponent = User.find_by(name: "default")
  end
  
  def new

    @card = Card.new
  end

  def create
  @card = Card.create( card_params )
  redirect_to "/cards/#{@card.id}"
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.update( card_params )
    redirect_to "/cards/#{@card.id}"
  end

  def show
    @card = Card.find(params[:id])
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def card_params
    params.require(:card).permit(:image, :name, :cost, :description, :action_text, :attack)
  end
end
