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

    2.times do
      @player_one.draw_card
    end

    3.times do
      @player_two.draw_card
    end

    redirect_to "/games/#{game.id}/attack"
  end

  def attack
  end

  def deal_damage
    
    my_card_ids = params[:my_cards]
    damage_total = 0
    mana_cost = 0
    
      my_card_ids.each do |my_card_id|
        my_card = MyCard.find(my_card_id)
        damage_total += my_card.attack
        mana_cost += my_card.cost
      end

    if @mana_slots >= mana_cost
      @player_two_participation.decrease_hp(damage_total)
      @game.spend_mana(mana_cost)
      my_card_ids.each do |my_card_id|
        my_card = MyCard.find(my_card_id)
        my_card.discard
      end
      redirect_to "/games/#{@game.id}/attack"
      #flash[:default] = @my_card.card.action_text
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
      ActionCable.server.broadcast 'game_channel', action: "refresh"
      #redirect_to "/games/#{@game.id}/attack"
    end

  end

  def victory
    
  end

private

  def set_attack_stats
    @game = Game.find(params[:id])
    @opponent = @game.users.where.not(id: current_user.id).first
    @player_one = @game.active_player
    @player_two = @game.inactive_player
    @player_one_participation = @player_one.participation_with(@game)
    @player_two_participation = @player_two.participation_with(@game)
    @player_one_mana = @player_one_participation.mana
    @player_two_hp = @player_two_participation.hp
    @mana_slots = @game.mana_slots 
    @cardback = Card.find_by(name: "back")
  end

end
