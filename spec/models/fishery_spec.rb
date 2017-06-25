describe Fishery, type: :model, focus: true  do

  before do
    stub_google_geocode_lat_lng
    stub_google_geocode_address
    create_species
    create_water_types
    water_one = FactoryGirl.create(:water, name: 'z', species_ids: [1,2], water_type_id: 1)
    water_two = FactoryGirl.create(:water, name: 'a', species_ids: [1,2,3], water_type_id: 2)
    @fishery = FactoryGirl.create(:fishery, name: 'my fishery', waters: [water_one, water_two])
  end

  describe 'validate fields' do
    it 'is not valid without a name' do
      @fishery.name = nil
      expect(@fishery).not_to be_valid
    end

    it 'is not valid without a description' do
      @fishery.description = nil
      expect(@fishery).not_to be_valid
    end
  end

  describe 'all species from across all waters of a fishery' do

      it 'returns the species' do
        expect(@fishery.species).to eql ["brown trout", "salmon", "sea trout"]
      end

  end

  describe 'all water types across all waters of a fishery' do
      it 'returns the water types' do
        expect(@fishery.water_types).to eql ['lake', 'river']
      end

  end

  describe 'water ordering' do
    it 'waters are ordered alphabetically A to Z' do
      expect("#{Fishery.last.waters.first.name} & #{Fishery.last.waters.last.name}").to eql 'a & z'
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


  describe 'geographical center of all the waters in a fishery' do

    it 'returns a lat,lng' do
      expect(@fishery.geographic_center_of_waters).to eql Geocoder::Calculations.geographic_center(@fishery.waters)
    end

  end
end
