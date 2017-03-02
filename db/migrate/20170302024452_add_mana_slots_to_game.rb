class AddManaSlotsToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :mana_slots, :integer
  end
end
