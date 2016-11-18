module GooglePlacesService
  include HTTParty
  include PlacesBuilder
  include PlaceBuilder
  base_uri 'https://maps.googleapis.com'
  API_KEY = Rails.application.config.google_api_key

  def self.places(lat:, lng:, type:, zoom:)
    begin
      radius = self.zoom_to_radius
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


  def self.zoom_to_radius(zoom)

    if zoom.between?(1, 5)
      34000  #20 miles
    end

    if zoom.between?(6, 10)
      17000  #10 miles
    end


    1  World
    5 Landmass/continent
    10 City
    15 Streets
    20 Buildings

    34000  20 miles
    17000  10 miles
    8500   5 miles


  end

end
