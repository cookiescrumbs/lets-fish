describe Place, type: :model, focus: true do
  before(:each) do
    @place = Place.new do
       self.id = 128318723,
       self.name =  "Cookies Hotel",
       self.types = ['lodging', 'campground', 'point_of_interest', 'establishment']
    end
  end

  it 'type_icon' do
    expect(@place.type_icon).to eql 'hotel'
  end

end
