class Game < ApplicationRecord
  has_many :game_participations
  has_many :users, through: :game_participations

  def active_player
    game_participations.find_by(order: current_player).user
  end
  
  def inactive_player  
    game_participations.where.not(order: current_player).first.user
  end

  def switch_players
    
  end

end
