# https://api.openweathermap.org/data/2.5/onecall/timemachine?lat=60.99&lon=30.9&dt=1633116829&appid=391e41e9133b2a33864ce197eb86b285

# https://api.openweathermap.org/data/2.5/onecall?lat=60.3083074300101&lon=-1.40687489047855&appid=391e41e9133b2a33864ce197eb86b285


class OpenWeatherService
  include HTTParty

  base_uri 'https://api.openweathermap.org/data/2.5'
  API_KEY = Rails.application.config.open_weather_api_key

  def self.timemachine(lat:, lng:, dt: )
    begin
      response = get("/onecall/timemachine?units=metric&lat=#{lat}&lon=#{lng}&dt=#{dt}&appid=#{OpenWeatherService::API_KEY}", timeout: 1)
      return {} unless response.code === 200
      response
    rescue
      {}
    end
  end

  def self.forecast(lat:, lng:)
    begin
      response = get("/onecall?units=metric&lat=#{lat}&lon=#{lng}&appid=#{OpenWeatherService::API_KEY}", timeout: 1)
      return {} unless response.code === 200
      response
    rescue
      {}
    end 
  end
end
