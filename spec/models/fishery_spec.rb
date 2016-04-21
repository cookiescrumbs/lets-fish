describe Fishery, :type => :model, focus: true do

  describe "validate fields" do

    before do
      stub_google_geocode_address
      @fishery = FactoryGirl.create(:fishery)
    end

    it "is not valid without a name" do
      @fishery.name = nil
      expect(@fishery).not_to be_valid
    end
  end

  describe 'latitude and longitude' do

    context 'has a Google place id' do

      before do
        stub_google_geocode_address
        stub_google_places_details
        @fishery = FactoryGirl.create(:fishery)
      end

      it 'uses latitude from Google places' do
        expect(@fishery.latitude).to eql(53.993151)
      end

      it 'uses longitude form Google places' do
        expect(@fishery.longitude).to eql(-2.431154)
      end

    end

    context 'has no Google place id' do

      before do
        stub_google_geocode_address
        @fishery = FactoryGirl.create(:fishery, place_id: nil)
      end

      it 'uses address model latitude' do
        expect(@fishery.latitude).to eql(53.4807593)
      end

      it 'Uses address model longitude' do
        expect(@fishery.longitude).to eql(-2.2426305)
      end

    end


  end


end
