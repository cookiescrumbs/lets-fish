module MapMarkers
  module Places
    def self.build(places, type)
      places.map do | place |
        PlaceMarker.new(
          id: place.id,
          lat: place.lat,
          lng: place.lng,
          name: place.name,
          type: type
        )
      end
    end
  end
end
