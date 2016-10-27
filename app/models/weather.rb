class Weather

  attr_accessor :lat, :lng, :wind_speed, :wind_bearing, :time, :summary, :icon

  def initialize(&block)
    instance_eval &block if block_given?
  end

  def forecast
    { time: time_at, lat: lat, lng: lng, wind_speed: wind_speed, wind_bearing: wind_bearing, wind_direction: wind_direction, summary: summary, icon: icon}
  end

  def wind_direction
    directions = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
    directions[(self.wind_bearing + 11.25)/22.5 % 16]
  end

  def time_at
    Time.at(self.time)
  end
end