module GooglePlacesService
  include PlaceBuilder
  API_KEY = Rails.application.config.google_api_key

  def self.places(lat:, lng:)
    spot(spots(lat,lng))
  end

  def self.spots(lat,lng)
    google_places = GooglePlaces::Client.new(GooglePlacesService::API_KEY)
    google_places.spots(lat,lng, types: ['lodging', 'campground'], radius: 17000)
  end

  def self.spot(spots)
    google_places = GooglePlaces::Client.new(GooglePlacesService::API_KEY)

    spots.map do | spot |
      PlaceBuilder::build(google_places.spot(spot.place_id))
    end

  end

end