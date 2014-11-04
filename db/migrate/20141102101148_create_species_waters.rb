class CreateSpeciesWaters < ActiveRecord::Migration
  def change
    create_table :species_waters, id: false do |t|
      t.belongs_to :species
      t.belongs_to :water
    end
  end
end
