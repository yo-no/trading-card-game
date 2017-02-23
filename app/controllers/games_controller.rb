class GamesController < ApplicationController

  before_action :set_attack_stats, only: [:attack, :deal_damage]

  def new

  end

  def create
    game = Game.create
    @player_one = User.find(1)
    @player_two = User.find(2)
    @player_one_game = GameParticipation.create(
                              user_id: 1,
                              game_id: game.id,
                              hp: 30,
                              mana: 1,
                              order: 1
                              )

    @player_two_game = GameParticipation.create(
                              user_id: 2,
                              game_id: game.id,
                              hp: 30,
                              mana: 1,
                              order: 2
                              )

    @player_one.initialize_deck
    @player_two.initialize_deck

    3.times do
      @player_one.draw_card
      @player_two.draw_card
    end

    redirect_to "/games/#{game.id}/attack"
  end

  def attack

  end

  def deal_damage
    @my_card = MyCard.find(params[:my_card_id])
    if @mana_slots >= @my_card.attack 
      @player_two_participation.decrease_hp(@my_card.attack)
      @player_one_participation.increase_mana
      redirect_to "/games/#{@game.id}/attack"
    else
      flash[:warning] = "insufficient mana"
      render :attack
    end   
  end

private

  def set_attack_stats
    @game = Game.find(params[:id])
    @player_one = @game.active_player
    @player_two = @game.inactive_player
    @player_one_participation = @player_one.participation_with(@game)
    @player_two_participation = @player_two.participation_with(@game)
    @player_one_mana = @player_one_participation.mana
    @player_two_hp = @player_two_participation.hp
    @mana_slots = @player_one_mana
  end

end
