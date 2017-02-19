class AddStatusToMyCards < ActiveRecord::Migration[5.0]
  def change
    add_column :my_cards, :status, :string
  end
end
