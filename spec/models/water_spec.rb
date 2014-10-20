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

      describe "seasons" do

        it "changes the year of the date to 2012 (a leap year)" do
          water.season_start = Date.new(2002).to_s
          expect(water.season_start).to eql Date.new(2012)
        end

      end



    end
end
