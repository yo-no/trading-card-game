class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :cost
      t.integer :attack
      t.text :description

      t.timestamps
    end
  end
end
