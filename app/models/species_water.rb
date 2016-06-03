class SpeciesWater < ActiveRecord::Base
  belongs_to :water
  belongs_to :species
end
