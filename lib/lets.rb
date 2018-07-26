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
      water = Water.where(published: true).includes(:fishery).where('fisheries.published' => true).order("RANDOM()").first
      return water if water.hero_image.present?
      random
    end

    def self.random_from(fishery_slug)
      Water.where(published: true).includes(:fishery).where('fisheries.published' => true, 'fisheries.slug' => fishery_slug).order("RANDOM()").first
    end
  end
end
