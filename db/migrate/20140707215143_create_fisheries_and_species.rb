class CreateFisheriesAndSpecies < ActiveRecord::Migration
  def change
    create_table :fisheries_species, id: false do |t|
      t.belongs_to :fishery
      t.belongs_to :species
    end
  end
end
