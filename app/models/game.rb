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
    if current_player == 1
      self.current_player = 2
      save
    else
      self.current_player = 1
      save
    end
  end


  def restore_mana_slots
    self.mana_slots = self.game_participations.find_by(order: current_player).mana
    save
  end

  def spend_mana(card_cost)
    self.mana_slots -= card_cost
    save
  end



end
