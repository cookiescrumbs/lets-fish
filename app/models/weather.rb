class Weather

  attr_accessor :lat, :lng, :wind_speed, :wind_bearing, :time, :summary, :icon

  def initialize(&block)
    instance_eval &block if block_given?
  end

  def forecast
    { time: time_at, lat: lat, lng: lng, wind_speed: wind_speed, wind_bearing: wind_bearing, wind_direction_string: wind_direction_string, wind_direction: wind_direction,summary: summary, icon: icon }
  end

  def wind_direction_string
    directions = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
    directions[(self.wind_bearing + 11.25)/22.5 % 16]
  end

  def wind_direction
    (wind_bearing - 180).abs
  end

  def time_at
    Time.at(self.time) unless !self.time
  end
end