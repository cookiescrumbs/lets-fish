describe Water, :type => :model do
  
  before { @water = FactoryGirl.create(:water) }

    it "is not valid without a name" do
      @water.name = nil
      expect(@water).not_to be_valid
    end

    it "is not valid without a fishery id" do
      @water.fishery_id = nil
      expect(@water).not_to be_valid
    end

    describe "location" do

      it "validates the longitude and latitude" do
        @water.longitude = -100000
        @water.latitude = 100000
        expect(@water).not_to be_valid
      end
      
    end

    describe "seasons" do
      
      it "changes the seasons year to 2012 (a leap year)" do
        @water.season_start = Date.new(2002).to_s
        expect(@water.season_start).to eql Date.new(2012)

        @water.season_end = Date.new(2002).to_s
        expect(@water.season_end).to eql Date.new(2012)
      end

    end
end
