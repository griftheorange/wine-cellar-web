class CreateStashes < ActiveRecord::Migration[6.0]
  def change
    create_table :stashes do |t|
      t.belongs_to :bottle, null: false, foreign_key: true
      t.belongs_to :cellar, null: false, foreign_key: true

      t.timestamps
    end
  end
end
