# https://api.darksky.net/forecast/0a41a01031a5b6fa9241b180875eb218/37.8267,-122.4233
module DarkSkyService
  include HTTParty
  base_uri 'https://api.darksky.net'

  def self.forecast(api_key:, lat:, lng:)
    begin
      response = get("/forecast/#{api_key}/#{lat},#{lng}", timeout: 1)
      return {} unless response.code === 200
      response
    rescue
      {}
    end
  end
end
