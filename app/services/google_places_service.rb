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
    places_q = Queue.new
    spots_q = Queue.new
    number_of_threads = 4

    spots.each do | spot |
      spots_q << spot
    end

    number_of_threads.times do
      threads << thr = Thread.new do
        until spots_q.empty?
          begin
            spot = spots_q.pop
            places_q << PlaceBuilder::build(google_places.spot(spot.place_id))
          rescue
            Thread.kill(thr)
          end
        end
      end
    end

    threads.each do | t |
      t.join
    end

    until places_q.empty?
      places << places_q.pop
    end
    places
  end

end




