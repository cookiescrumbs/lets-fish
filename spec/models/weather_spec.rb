describe Weather, type: :model do

  before do
    @weather = Weather.new do
      self.lat = 56.002120300185574
      self.lng = -5.958730311373353
      self.wind_speed =  13.79
      self.wind_bearing = 22
      self.condition = '01d'
    end
  end

  it 'forecast' do
    forecast = { time: nil, lat: 56.002120300185574, lng: -5.958730311373353, wind_speed: 31, wind_bearing: 22, wind_direction_string: "NNE", summary: nil, icon: 'wi-day-sunny' }
    expect(@weather.forecast).to eql forecast
  end

  it 'icon' do
    expect(@weather.icon).to eql 'wi-day-sunny'
  end

end
