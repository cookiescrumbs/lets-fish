require 'homepage'

describe Homepage do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      FactoryGirl.create_list(:fishery_with_waters, 5, published: true )
      FactoryGirl.create_list(:fishery_with_waters, 1, published: false)
      FactoryGirl.create :fishery, name: 'fishery with no waters'
    end

  describe Homepage::Fisheries, '.recently_added' do

    it 'returns published fisheries with waters' do
      expect(Homepage::Fisheries::recently_added.count).to eql 3
    end

    it 'returns number of published fisheries with waters' do
      expect(Homepage::Fisheries::recently_added(5).count).to eql 5
    end

  end

  describe Homepage::Waters, '.recently_added' do

    it 'returns new waters from published fisheries' do
      expect(Homepage::Waters::recently_added.count).to eql 3
    end

    it 'returns number of waters from published fisheries' do
      expect(Homepage::Waters::recently_added(2).count).to eql 2
    end

  end

end