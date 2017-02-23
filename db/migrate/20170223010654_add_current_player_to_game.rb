class AddCurrentPlayerToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :current_player, :integer, default: 1
  end
end
