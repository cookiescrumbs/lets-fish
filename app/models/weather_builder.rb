module WeatherBuilder

  def self.build(data:)
    Weather.new do
      self.wind_speed =  data['current']['wind_speed'] || nil
      self.wind_bearing = data['current']['wind_deg'] || nil
      self.temperature = data['current']['temp'] || nil
      self.summary = data['current']['weather'][0]['description']|| nil
      self.condition = data['current']['weather'][0]['icon'] || nil
      self.time = data['current']['dt'] || nil
      self.lat = data['lat'] || nil
      self.lng = data['lon'] || nil
    end
  end

end
