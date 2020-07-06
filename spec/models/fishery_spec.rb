describe Fishery, type: :model do
  before do
    stub_google_geocode_lat_lng
    stub_google_geocode_address
    create_species
    create_water_types
    water_one = FactoryGirl.create(:water, name: 'z', species_ids: [1, 2], water_type_id: 1)
    water_two = FactoryGirl.create(:water, name: 'a', species_ids: [1, 2, 3], water_type_id: 2)
    FactoryGirl.create(:fishery, name: 'my fishery', waters: [water_one, water_two])
  end

  describe 'validate fields' do
    it 'is not valid without a name' do
      expect(FactoryGirl.build(:fishery, name: nil)).not_to be_valid
    end

    it 'is not valid without a description' do
      expect(FactoryGirl.build(:fishery, description: nil)).not_to be_valid
    end
  end

  describe 'all species from across all waters of a fishery' do
    it 'returns the species' do
      expect(Fishery.last.species).to eql ['brown trout', 'salmon', 'sea trout']
    end
  end

  describe 'all water types across all waters of a fishery' do
    it 'returns the water types' do
      expect(Fishery.last.water_types).to eql %w(lake river)
    end
  end

  describe 'water ordering' do
    it 'waters are ordered alphabetically A to Z' do
      expect("#{Fishery.last.waters.first.name} & #{Fishery.last.waters.last.name}").to eql 'a & z'
    end
  end

  describe 'latitude and longitude' do
      before do
        stub_google_geocode_address
        FactoryGirl.create(:fishery)
      end

      it 'uses address model latitude' do
        expect(Fishery.last.latitude).to eql(53.4807593)
      end

      it 'Uses address model longitude' do
        expect(Fishery.last.longitude).to eql(-2.2426305)
      end
  end

  describe 'geographical center of all the waters in a fishery' do
    it 'returns a lat,lng' do
      expect(Fishery.last.geographic_center_of_waters).to eql Geocoder::Calculations.geographic_center(Fishery.last.waters)
    end
  end
end
