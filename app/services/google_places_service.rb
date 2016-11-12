module GooglePlacesService
  include PlacesBuilder
  include PlaceBuilder
  API_KEY = Rails.application.config.google_api_key

  def self.places(lat:, lng:)
    google_places = GooglePlaces::Client.new(GooglePlacesService::API_KEY)
    places = google_places.spots(lat,lng, types: ['campground'], radius: 17000)
    PlacesBuilder::build(places)
  end

  def self.place(id)
    google_places = GooglePlaces::Client.new(GooglePlacesService::API_KEY)
    PlaceBuilder::build(google_places.spot(id))
  end

end
