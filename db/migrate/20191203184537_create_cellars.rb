class CreateCellars < ActiveRecord::Migration[6.0]
  def change
    create_table :cellars do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
