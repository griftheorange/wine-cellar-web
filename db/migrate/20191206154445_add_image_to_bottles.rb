class AddImageToBottles < ActiveRecord::Migration[6.0]
  def change
    add_column :bottles, :image, :string
  end
end
