module GooglePlacesService
  include HTTParty
  include PlacesBuilder
  include PlaceBuilder
  base_uri 'https://maps.googleapis.com'
  API_KEY = Rails.application.config.google_api_key

  def self.places(lat:, lng:, type:, zoom:)
    begin
      radius = self.radius_from zoom
      response = get("/maps/api/place/nearbysearch/json?key=#{GooglePlacesService::API_KEY}&location=#{lat},#{lng}&radius=#{radius}&types=#{type}", timeout: 1)
      return {} unless response.code === 200
      PlacesBuilder::build(response['results'])
    rescue
      {}
    end
  end

  def self.place(id)
    begin
      response = get("/maps/api/place/details/json?key=#{GooglePlacesService::API_KEY}&language=en&placeid=#{id}", timeout: 1)
      return {} unless response.code === 200
      PlaceBuilder::build(response['result'])
    rescue
      {}
    end
  end


  def self.radius_from(zoom)
    zoom = zoom.to_i
    if zoom.between?(1, 10)
      return 34000  #20 miles
    end
    
    if zoom.between?(11, 15)
      return 8500   #5 miles
    end

    if zoom.between?(16, 20)
      return 4250 #2 miles
    end
  end

end
