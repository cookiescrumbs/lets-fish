require_relative '../serializers/weather_serializer'

class WeatherService

  def initialize(api_key:)
    @api_key = api_key
  end

  def forecast_from(lat:, lng:)
    json = DarkSkyService::forecast(api_key: @api_key, lat: lat, lng: lng).to_json
    Weather.new().from_json(json)
  end

end