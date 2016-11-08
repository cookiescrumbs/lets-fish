module GooglePlacesService
  API_KEY = Rails.application.config.google_api_key
  def self.places(lat:, lng:)
    google_places = GooglePlaces::Client.new(GooglePlacesService::API_KEY)
    google_places.spots(lat,lng, types: ['lodging', 'campground'], radius: 17000 )
  end
end
