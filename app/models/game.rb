class Game < ApplicationRecord
  has_many :game_participations
  has_many :users, through: :game_participations

  #@player_one = current_user
  #@player_two = Game.user.where(user_id!=current_user)

      

end
