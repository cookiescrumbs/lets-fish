module PlaceBuilder
  def self.build(place)
    Place.new do
      self.id = place['place_id']
      self.name = place['name']
      self.lat = place['geometry']['location']['lat']
      self.lng = place['geometry']['location']['lng']
      self.types = place['types']
      self.address = place['formatted_address']
      self.telephone = place['formatted_phone_number']
      self.website = place['website']
      self.reviews = place['reviews']
      self.photos = place['photos']
      self.rating = place['rating']
    end
  end
end