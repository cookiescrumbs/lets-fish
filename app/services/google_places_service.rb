module GooglePlacesService
  API_KEY = Rails.application.config.dark_sky_api_key
  def self.places(lat:, lng:)
    google_places = GooglePlaces::Client.new(GooglePlacesService::API_KEY)
    google_places.spots(lat,lng, types: ['lodging', 'campground'], radius: five_miles )
  end
end
