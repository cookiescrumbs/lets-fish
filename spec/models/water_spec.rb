describe Water, :type => :model do

  before do
    stub_google_geocode
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

      it "handles an address with a postcode" do
        @water.address = "Unnamed Road, Morpeth, Northumberland NE65 7LG, UK"
        expect(@water.short_address).to eql "Morpeth, Northumberland"
      end

      it "handles an address with no elements" do
        @water.address = ""
        expect(@water.short_address).to eql nil
      end

      it "handles an address with one element" do
        @water.address = "Northumberland"
        expect(@water.short_address).to eql "Northumberland"
      end

      it "handles an address with two elements and no postcode" do
        @water.address = "Unnamed Road, Northumberland"
        expect(@water.short_address).to eql "Northumberland"
      end

      it "handles an address with three element and no postcode " do
        @water.address = "Unnamed Road, Northumberland, UK"
        expect(@water.short_address).to eql "Northumberland, UK"
      end

     it "handles an address with four elements and no postcode" do
        @water.address = "Unnamed Road, Cumnor, Oxfordshire, UK"
        expect(@water.short_address).to eql "Cumnor, Oxfordshire"
     end

      it "handles a nil address" do
        @water.address = nil
        expect(@water.short_address).to eql nil
      end

    end
end
