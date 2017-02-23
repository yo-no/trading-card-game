class AddCurrentPlayerToGameParticipations < ActiveRecord::Migration[5.0]
  def change
    add_column :game_participations, :order, :integer
  end
end
