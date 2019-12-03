class CreateBottles < ActiveRecord::Migration[6.0]
  def change
    create_table :bottles do |t|
      t.string :brand
      t.string :type
      t.string :color
      t.integer :year

      t.timestamps
    end
  end
end
