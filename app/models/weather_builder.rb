module WeatherBuilder

  def self.build(data:)
    Weather.new do
      self.wind_speed =  data['currently']['windSpeed'] || nil
      self.wind_bearing = data['currently']['windBearing'] || nil
      self.lat = data['latitude'] || nil
      self.lng = data['longitude'] || nil
    end
  end

end