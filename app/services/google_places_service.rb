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
    threads = []
    places = []
    spots.each do | spot |
      threads << thr = Thread.new do
        begin
          places << PlaceBuilder::build(google_places.spot(spot.place_id))
        rescue
          Thread.kill(thr)
        end
      end
    end
    threads.each do | t |
      t.join
    end
    places
  end

end







