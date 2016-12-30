module Lets

  module Fisheries
    def self.recently_added(number=3)
      Fishery.where(published: true).includes(:waters).where.not('waters.id' => nil).order('fisheries.id desc').limit(number)
    end
  end

  module Waters
    def self.recently_added(number=3)
      Water.includes(:fishery).where('fisheries.published' => true).order('waters.id desc').limit(number)
    end

    def self.all
      Water.includes(:fishery).where('fisheries.published' => true).order('waters.id desc')
    end
  end

end