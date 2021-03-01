# https://api.darksky.net/forecast/0a41a01031a5b6fa9241b180875eb218/37.8267,-122.4233
module DarkSkyService
  include HTTParty
  base_uri 'https://api.darksky.net'
  API_KEY = Rails.application.config.dark_sky_api_key

  def self.forecast(lat:, lng:)
    begin
      response = get("/forecast/#{DarkSkyService::API_KEY}/#{lat},#{lng}/?units=uk2", timeout: 1)
      return {} unless response.code === 200
      response
    rescue 
      {}
    end
  end

end
