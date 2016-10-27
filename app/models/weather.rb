class Weather

  attr_accessor :lat, :lng, :wind_speed, :wind_bearing

  def initialize(&block)
    instance_eval &block if block_given?
  end

  def forecast
    { lat: lat, lng: lng, wind_speed: wind_speed, wind_bearing: wind_bearing }
  end
end