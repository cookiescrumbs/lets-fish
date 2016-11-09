describe Place, type: :model do

  before do
    @weather = place.new do
      self.id = 1233456
      self.lat = 56.002120300185574
      self.lng = -5.958730311373353
      self.name = 'My Place'
      self.types = []
    end
  end

end