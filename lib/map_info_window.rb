module MapInfoWindow
  module Places
    def self.build(place)
      InfoWindow.new do
        self.body = { address: place.address, telephone: place.telephone, website: place.website }
        self.footer = { stars: place.stars }
      end
    end
  end
end