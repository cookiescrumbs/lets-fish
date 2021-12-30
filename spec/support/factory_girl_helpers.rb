module FactoryBotHelpers
	def create_species
		['brown trout','sea trout','salmon','grayling','rainbow trout'].each do | species |
	  	FactoryBot.create :species, { name: species }
	  end
	end

	def create_water_types
		 ['lake', 'river'].each do | water_type |
	  	FactoryBot.create :water_type, { category: water_type }
	  end 
	end

  def published_fisheries_with_published_waters(number)
    FactoryBot.create_list :fishery_with_waters, number, published: true 
  end
  
  def published_fishery_with_unpublished_water
    unpublished_water = FactoryBot.create :water, name: 'z', species_ids: [1, 2], water_type_id: 1, published: false
    FactoryBot.create :fishery, name: 'with unpublished water', published: true, waters: [unpublished_water]
  end
  
  def unpublished_fishery_with_published_waters(number)
    FactoryBot.create_list :fishery_with_waters, number, published: false
  end
  
  def published_fishery_with_no_waters
    FactoryBot.create :fishery, name: 'fishery with no waters', published: true
  end

end


