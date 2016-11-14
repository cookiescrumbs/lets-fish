describe Place, type: :model, focus: true do

  before do
    @place = Place.new do
      self.id = 1233456
      self.lat = 56.002120300185574
      self.lng = -5.958730311373353
      self.name = 'My Place'
      self.types = ['dog', 'mouse', 'cat']
    end
  end

  it 'returns the name' do
    expect(@place.name).to eql 'My Place'
  end

end