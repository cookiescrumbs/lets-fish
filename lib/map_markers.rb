module MapMarkers
  module Places
    def self.build(places)
      places.map do | place |
        PlaceMarker.new(
          id: place.place_id,
          lat: place.lat,
          lng: place.lng,
          name: place.name,
          types: place.types,
          address: place.formatted_address,
          telephone: place.formatted_phone_number
        )
      end
    end
  end
end
