describe Insect, :type => :model do
  
  before(:each) do
    @insect = Insect.new
  end

  it "is not valid without a name" do
    @insect.name = nil
    expect(@insect).not_to be_valid
  end

end
