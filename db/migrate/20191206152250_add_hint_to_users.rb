class AddHintToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :hint, :string
  end
end
