class Weather

  attr_accessor :lat, :lng, :wind_speed, :wind_bearing, :time, :summary, :condition, :temperature

  def initialize(&block)
    instance_eval &block if block_given?
  end

  def forecast
    { time: time_at, lat: lat, lng: lng, wind_speed: wind_speed, wind_bearing: wind_bearing, wind_direction_string: wind_direction_string, wind_direction: wind_direction, summary: summary, icon: icon, celsius: celsius, fahrenheit: fahrenheit }
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

  def icon
    condition_to_icon = {
      'clear-day' => 'wi-day-sunny',
      'clear-night' => 'wi-night-clear',
      'rain' => 'wi-showers',
      'snow' => 'wi-snow',
      'sleet'=> 'wi-sleet',
      'wind' => 'wi-strong-wind',
      'fog' => 'wi-strong-wind',
      'cloudy' => 'wi-cloudy',
      'partly-cloudy-day' => 'wi-day-cloudy',
      'partly-cloudy-night' => 'wi-night-alt-cloudy'
    }
    condition_to_icon[self.condition]
  end

  def celsius
    self.temperature
  end

  def fahrenheit
    self.temperature
  end


end