describe Fishery, :type => :model do
  
  describe "validate fields" do
    
    before { @fishery = FactoryGirl.create(:fishery) }

    it "is not valid without a name" do
      @fishery.name = nil
      expect(@fishery).not_to be_valid
    end

    it "is not valid without an address" do
      @fishery.address = nil
      expect(@fishery).not_to be_valid
    end

    it "is not valid without contact details" do
      @fishery.contact_details = nil
      expect(@fishery).not_to be_valid
    end

  end

end