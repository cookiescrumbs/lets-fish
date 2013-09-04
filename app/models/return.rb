class Return < ActiveRecord::Base
  has_many :fishs

  validates_presence_of :name, :ticket

  def total_number
    fishs.count
  end

  def total_weight
    total_weight = 0
    fishs.each do | fish |
      total_weight += fish.weight
    end
    total_weight
  end

  def best_fish
    weights = []
    fishs.each do | fish |
      weights << fish.weight
    end
    weights.sort.last
  end

  def best_species
    species = {}
    fishs.each do | fish |
      if species.include?(fish.species)
        species[fish.species] = fish.weight if species[fish.species] < fish.weight 
      else
        species[fish.species] = fish.weight
      end
    end
    species
  end


end
