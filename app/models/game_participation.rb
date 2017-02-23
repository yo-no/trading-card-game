class GameParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :game

  def increase_mana
    mana_awarded = 1
    self.mana = mana + mana_awarded
    save
  end

  def decrease_hp(card_attack)
    self.hp = hp - card_attack
    save
  end

  def current_player
    
  end
      
end
