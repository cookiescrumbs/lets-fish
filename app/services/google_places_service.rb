module GooglePlacesService
  include HTTParty
  include PlacesBuilder
  include PlaceBuilder
  base_uri 'https://maps.googleapis.com'
  API_KEY = Rails.application.config.google_api_key

  def self.places(lat:, lng:, type:)
    begin
      response = get("/maps/api/place/nearbysearch/json?key=#{GooglePlacesService::API_KEY}&location=#{lat},#{lng}&radius=17000&types=#{type}", timeout: 1)
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

end
