require 'lets'

describe Lets do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      FactoryGirl.create_list(:fishery_with_waters, 5, published: true )
      FactoryGirl.create_list(:fishery_with_waters, 1, published: false)
      FactoryGirl.create :fishery, name: 'fishery with no waters'
    end

  let(:total_published_waters) { 25 }
  let(:total_published_fisheries) { 5 }

  describe Lets::Fisheries, '.recently_added' do

    it 'returns published fisheries with waters limited to 3' do
      expect(Lets::Fisheries::recently_added.count).to eql 3
    end

    it 'returns number of published fisheries with waters limited to 5' do
      expect(Lets::Fisheries::recently_added(5).count).to eql 5
    end

  end

  describe Lets::Waters, '.recently_added' do

    it 'returns new waters from published fisheries limited to 3' do
      expect(Lets::Waters::recently_added.count).to eql 3
    end

    it 'returns number of waters from published fisheries limited to 2' do
      expect(Lets::Waters::recently_added(2).count).to eql 2
    end

  end

  describe Lets::Waters, '.all' do

    it 'returns all the waters from published fisheries in alphabetical order' do
      expect(Lets::Waters::all.count).to eql total_published_waters
    end

  end

   describe Lets::Fishery, '.all' do

    it 'returns all the published fisheries in alphabetical order' do
      expect(Lets::Fisheries::all.count).to eql total_published_fisheries
    end

  end

end