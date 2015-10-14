describe Water, :type => :model do

  before do
    stub_google_geocode
    @species    = FactoryGirl.create_list :species, 5
    @water_type = FactoryGirl.create_list :water_type, 5
    @water = FactoryGirl.create(:water, latitude: -41.21924848834151 , longitude: -70.70650221597815 )
  end

    it "is not valid without a name" do
      @water.name = nil
      expect(@water).not_to be_valid
    end

    it "is not valid without a fishery id" do
      @water.fishery_id = nil
      expect(@water).not_to be_valid
    end

    it "is not valid without a species" do
      @water.species = []
      expect(@water).not_to be_valid
    end

    it "is not valid without a water type" do
      @water.water_type_id = nil
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

    describe "Address" do

      it "is the 'formatted address' from google maps goecode api" do
        expect(@water.address).to eql("Pilcaniyeu, Río Negro, Argentina")
      end

    end
end
