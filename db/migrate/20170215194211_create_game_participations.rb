class CreateGameParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :game_participations do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :hp
      t.integer :mana

      t.timestamps
    end
  end
end
