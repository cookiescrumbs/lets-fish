module PlacesBuilder
  def self.build(places)
    places.map do | place |
      Place.new do
        self.id = place['place_id']
        self.name = place['name']
        self.lat = place['geometry']['location']['lat']
        self.lng = place['geometry']['location']['lng']
        self.types = place['types']
      end
    end
  end
end