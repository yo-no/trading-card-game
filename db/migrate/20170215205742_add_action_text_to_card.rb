class AddActionTextToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :action_text, :string
  end
end
