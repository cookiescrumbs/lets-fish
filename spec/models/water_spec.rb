describe Water, :type => :model do
  
  let(:water) { FactoryGirl.create(:water) }

    it "is not valid without a name" do
      water.name = nil
      expect(water).not_to be_valid
    end

    describe "location" do

      it "validates the longitude and latitude" do
        water.longitude = -100000
        water.latitude = 100000
        expect(water).not_to be_valid
      end
    end
end
