describe Place, type: :model do

  before do
    @place = Place.new do
      self.id = 1233456
      self.lat = 56.002120300185574
      self.lng = -5.958730311373353
      self.name = 'My Place'
      self.rating = 4.3
    end
  end

  it 'name' do
    expect(@place.name).to eql 'My Place'
  end

  it 'stars' do
    expect(@place.stars).to eql 4
  end

end