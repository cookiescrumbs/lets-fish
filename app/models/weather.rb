class Weather

  attr_accessor :lat, :lng, :wind_speed, :wind_bearing, :time, :summary, :condition, :temperature

  def initialize(&block)
    instance_eval &block if block_given?
  end

  def forecast
    { time: time_at, lat: lat, lng: lng, wind_speed: wind_speed_miles_per_hour, wind_bearing: wind_bearing, wind_direction_string: wind_direction_string, summary: summary, icon: icon }
  end

  def wind_speed_miles_per_hour
    (self.wind_speed * 2.2369).ceil
  end

  def wind_direction_string
    directions = ["N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW", "WSW", "W", "WNW", "NW", "NNW"]
    directions[(self.wind_bearing + 11.25)/22.5 % 16]
  end

  def time_at
    Time.at(self.time) if self.time
  end

  def icon
    puts self.condition
    condition_to_icon = {
      '01d' => 'wi-day-sunny',
      '01n' => 'wi-night-clear',
      '02n' => 'wi-night-partly-cloudy',
      '02d' => 'wi-cloudy',
      '10d' => 'wi-showers',
      '10n' => 'wi-showers',
      '13d' => 'wi-snow',
      '13n' => 'wi-snow',
      # 'sleet'=> 'wi-sleet',
      '50d' => 'wi-strong-wind',
      '50n' => 'wi-strong-wind',
      # 'fog' => 'wi-strong-wind',
      '03d' => 'wi-cloudy',
      '04d' => 'wi-day-cloudy',
      '04n' => 'wi-night-alt-cloudy'
    }
    condition_to_icon[self.condition]
  end

end
