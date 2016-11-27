require 'homepage'

describe Homepage do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      FactoryGirl.create_list(:fishery_with_waters, 5)
      FactoryGirl.create :fishery, name: 'fishery with no waters'
    end

  describe Homepage::Fisheries, '.recently_added' do

    it 'returns fisheries with waters' do
      expect(Homepage::Fisheries::recently_added.count).to eql 3
    end

    it 'returns number of fisheries with waters' do
      expect(Homepage::Fisheries::recently_added(5).count).to eql 5
    end

  end

  describe Homepage::Waters, '.recently_added' do

    it 'returns new waters' do
      expect(Homepage::Waters::recently_added.count).to eql 3
    end

    it 'returns number of waters' do
      expect(Homepage::Waters::recently_added(2).count).to eql 2
    end

  end

end