describe Species, :type => :model do
  
  before(:each) do
    @species = FactoryGirl.create :species
  end

  it "is not valid without a name" do
    @species.name = nil
    expect(@species).not_to be_valid
  end

end
