class Weather

  attr_accessor :lat, :lng, :wind_speed, :wind_bearing

  def initialize(&block)
    instance_eval &block if block_given?
  end

  def forecast
    { lat: lat, lng: lng, wind_speed: wind_speed, wind_bearing: wind_bearing, wind_direction: wind_direction}
  end

  def wind_direction
    directions = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
    directions[(self.wind_bearing + 11.25)/22.5 % 16]
  end
end