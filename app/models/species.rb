class Species < ActiveRecord::Base
  has_many :species_waters
  has_many :waters, through: :species_waters

  validates :name, presence: true

end
