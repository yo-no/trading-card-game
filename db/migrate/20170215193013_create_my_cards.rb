class CreateMyCards < ActiveRecord::Migration[5.0]
  def change
    create_table :my_cards do |t|
      t.integer :user_id
      t.integer :card_id
      t.boolean :deck

      t.timestamps
    end
  end
end
