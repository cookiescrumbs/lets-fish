class AddSeasonEndToSpeciesWater < ActiveRecord::Migration[5.0]
  def change
    add_column :species_waters, :season_end, :datetime
  end
end
