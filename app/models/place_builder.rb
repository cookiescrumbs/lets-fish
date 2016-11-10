module PlaceBuilder
  def self.build(place)
    Place.new do
      self.place_id = place.place_id
      self.name = place.name
      self.lat = place.lat
      self.lng = place.lng
      self.types = place.types
      self.formatted_address = place.formatted_address
      self.formatted_phone_number = place.formatted_phone_number
    end
  end
end