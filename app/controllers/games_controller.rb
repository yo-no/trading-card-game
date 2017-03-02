class GamesController < ApplicationController

  before_action :set_attack_stats, only: [:attack, :deal_damage, :end_turn, :victory]

  def index
    @games = current_user.games
    @current_user = current_user
  end

  def new

  end

  def create
    game = Game.create(mana_slots: 1)
    @player_one = current_user
    @player_two = User.find(params[:user][:user_id])
    @player_one_game = GameParticipation.create(
                              user_id: @player_one.id,
                              game_id: game.id,
                              hp: 30,
                              mana: 1,
                              order: 1
                              )

    @player_two_game = GameParticipation.create(
                              user_id: @player_two.id,
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
      @game.spend_mana(@my_card.cost)
      @my_card.discard
      redirect_to "/games/#{@game.id}/attack"
      flash[:default] = @my_card.card.action_text
    else
      flash[:warning] = "insufficient mana"
      render :attack
    end   
  end


  def end_turn
    if @player_two_hp <= 0
      redirect_to "/games/#{@game.id}/victory"
    else
      @game.switch_players
      @game.restore_mana_slots
      @player_one.draw_card
      @player_one_participation.increase_mana
      redirect_to "/games/#{@game.id}/attack"
    end

  end

  def victory
    @game.destroy
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
    @mana_slots = @game.mana_slots 
  end

end
