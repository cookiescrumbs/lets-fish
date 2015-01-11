describe Fishery, :type => :model do
  
  describe "validate fields" do
    
    before { @fishery = FactoryGirl.create(:fishery) }

    it "is not valid without a name" do
      @fishery.name = nil
      expect(@fishery).not_to be_valid
    end
    
  end

end