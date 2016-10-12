module FactoryGirlHelpers
	def create_species
		['brown trout','sea trout','salmon','grayling','rainbow trout'].each do | species |
	  	FactoryGirl.create :species, { name: species }
	  end
	end

	def create_water_types
		 ['lake', 'river'].each do | water_type |
	  	FactoryGirl.create :water_type, { category: water_type }
	  end 
	end
end


