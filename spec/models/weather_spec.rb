describe Weather, type: :model do

  before do
    @weather = Weather.new do
      self.lat = 56.002120300185574
      self.lng = -5.958730311373353
      self.wind_speed =  13.79
      self.wind_bearing = 22
    end
  end

  it 'forecast' do
    forecast = { time: nil, lat: 56.002120300185574, lng: -5.958730311373353, wind_speed: 13.79, wind_bearing: 22, wind_direction_string: "NNE", wind_direction: 158, summary: nil, icon: nil}
    expect(@weather.forecast).to eql forecast
  end


  it 'wind_direction' do
    expect(@weather.wind_direction).to eql 158
  end


end