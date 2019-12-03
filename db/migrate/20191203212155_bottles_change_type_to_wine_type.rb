class BottlesChangeTypeToWineType < ActiveRecord::Migration[6.0]
  def change
    rename_column :bottles, :type, :wine_type
  end
end
