describe Water, :type => :model do

  before do
    stub_google_geocode_lat_lng
    stub_google_geocode_address
    @species    = FactoryGirl.create_list :species, 5
    @water_type = FactoryGirl.create_list :water_type, 5
    @water = FactoryGirl.create(:water, address: nil, latitude: -41.21924848834151 , longitude: -70.70650221597815 )
    @water_with_address = FactoryGirl.create(:water, address: "Somewhere, Wales", latitude: -41.21924848834151 , longitude: -70.70650221597815 )
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

      context "water without an address" do
        it "is the 'formatted address' from google maps goecode api" do
          expect(@water.address).to eql "Manchester, UK"
        end
      end

      context "water with an address" do
        it "uses the address given" do
          expect(@water_with_address.address).to eql "Somewhere, Wales"
        end
      end

    end

    describe "short address" do

      it "handles an address with no elements" do
        @water.address = ""
        expect(@water.short_address).to eql nil
      end

      it "handles a nil address" do
        @water.address = nil
        expect(@water.short_address).to eql nil
      end

      it "returns the first two items of the formatted address" do
        @water.address = "Somewhere, Northumberland, UK"
        expect(@water.short_address).to eql "Somewhere, Northumberland"
      end

    end

    describe "meta tags", focus: true do

      describe "title" do

        it "returns a title tag string" do
          expect(@water.meta_title).to eql "Fly fishing at #{@water.name.strip}, #{@water.short_address}"
        end
    
      end

      describe "description" do

        context "water with description" do
        
          it "returns a description tag string including the water discription" do
            expect(@water.meta_description).to eql "#{@water.meta_title}. #{@water.description}"
          end

        end

      end

    end

end
