module MapMarkers
  module Places
    def self.build(places)
      places.map do | place |
        PlaceMarker.new(
          id: place.id,
          lat: place.lat,
          lng: place.lng,
          name: place.name,
          types: place.types
        )
      end
    end
  end
end
