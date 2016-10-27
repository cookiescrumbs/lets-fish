describe Weather, type: :model do

  before do
    @weather = Weather.new do
      self.lat = 56.002120300185574
      self.lng = -5.958730311373353
      self.wind_speed =  13.79
      self.wind_bearing = 22
    end
  end

  it 'returns a forecast hash' do
    forecast = { lat: 56.002120300185574, lng: -5.958730311373353, wind_speed: 13.79, wind_bearing: 221, wind_direction: "SW" }
    expect(@weather.forecast).to eql forecast
  end

end