module MapInfoWindow
  module Places
    def self.build(place)
      InfoWindow.new do
        self.body = { 
          address: place.address, 
          telephone: place.telephone, 
          website: place.website, 
          stars: place.stars,
          types: place.types
        }
      end
    end
  end
end