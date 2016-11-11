module PlacesBuilder
  def self.build(places)
    places.map do | place |
      Place.new do
        self.id = place.place_id
        self.name = place.name
        self.lat = place.lat
        self.lng = place.lng
        self.types = place.types
      end
    end
  end
end