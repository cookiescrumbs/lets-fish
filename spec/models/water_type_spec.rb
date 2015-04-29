describe WaterType, :type => :model do

  before(:each) do
    @water_type = FactoryGirl.create :water_type
  end

  it "is not valid without a category" do
    @water_type.category = nil
    expect(@water_type).not_to be_valid
  end

end
