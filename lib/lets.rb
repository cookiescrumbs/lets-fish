module Lets
  module Fisheries
    def self.recently_added(number = 3)
      Fishery.where(published: true).includes(:waters).where.not('waters.id' => nil).order('fisheries.id desc').limit(number)
    end

    def self.all
      Fishery.where(published: true).includes(:waters).where.not('waters.id' => nil).where('waters.published' => true).order(name: :asc)
    end
  end

  module Waters
    def self.recently_added(number = 3)
      Water.where(published: true).includes(:fishery).where('fisheries.published' => true).order('waters.id desc').limit(number)
    end

    def self.all
      Water.where(published: true).includes(:fishery).where('fisheries.published' => true).order(name: :asc)
    end

    def self.random
      Water.where(published: true).includes(:fishery).where('fisheries.published' => true).order("RANDOM()").first
    end

    def self.random_from(fishery_slug)
      Water.where(published: true).includes(:fishery).where('fisheries.published' => true, 'fisheries.slug' => fishery_slug).order("RANDOM()").first
    end

    def self.featured(number = 3) 
        Water.where(published: true, featured: true).includes(:fishery).where('fisheries.published' => true).order(name: :asc).limit(number)
    end

    def self.featured_all() 
        Water.where(published: true, featured: true).includes(:fishery).where('fisheries.published' => true).order(name: :asc)
    end
  end

  module Trips
    def self.private(status= false, number = 6)
      Trip.where(private: status ).limit(number)
    end
    def self.private_all(status= false)
      Trip.where(private: status )
    end
  end
end
