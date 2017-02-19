class GamesController < ApplicationController

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
                              mana: 0
                              )

    @player_two_game = GameParticipation.create(
                              user_id: 2,
                              game_id: game.id,
                              hp: 30,
                              mana: 0
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
    @game = Game.find(params[:id])
    @player_one = User.find(1)
    @player_two = User.find(2)
    player_one_participation = @player_one.game_participations.where(game_id: @game.id).first
    player_two_participation = @player_two.game_participations.where(game_id: @game.id).first
    @player_one_mana = player_one_participation.mana + 1
    @mana_slots = @player_one_mana
    @player_two_hp = player_two_participation.hp
  end

  def deal_damage
    @game = Game.find(params[:id])
    @my_card = MyCard.find(params[:my_card_id])
    @player_two = User.find(2)
    player_two_participation = @player_two.game_participations.where(game_id: @game.id).first
    @player_two_hp = player_two_participation.hp - @my_card.card.cost
    player_two_participation.update(hp: @player_two_hp)


    redirect_to "/games/#{@game.id}/attack"
  end

end
