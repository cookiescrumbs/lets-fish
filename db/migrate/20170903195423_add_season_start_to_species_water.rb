class AddSeasonStartToSpeciesWater < ActiveRecord::Migration[5.0]
  def change
    add_column :species_waters, :season_start, :datetime
  end
end
