module Homepage

  module Fisheries
    def self.recently_added(number=3)
      Fishery.includes(:waters).where.not('waters.id' => nil).limit(number)
    end
  end

  module Waters
    def self.recently_added(number=3)
      Water.order('id desc').limit(number)
    end
  end

end