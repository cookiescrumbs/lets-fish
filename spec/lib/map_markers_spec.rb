require 'map_markers'

describe MapMarkers::Places, '.build', focus: true do
  Place = Struct.new(:id, :name, :lat, :lng, :types)

  before(:each) do
    places = [*1..5].map do
      Place.new(id: 12345, name: 'a name', lat: 54.665559, lng: -2.299508, types: ['lodging', 'establishment', 'site_of_interest'])
    end
    @markers = MapMarkers::Places::build(places)
  end

  it 'returns an array of PlaceMarker objects' do
    expect(@markers.length).to eql 5
    expect(@markers.first.class).to eql PlaceMarker
  end

  context 'missing data' do
    before(:each) do
      places = [*1..5].map do
        Place.new(id: 12345, name: 'a name', lat: 54.665559, lng: -2.299508)
      end
      @markers = MapMarkers::Places::build(places)
    end

    it 'returns an array of PlaceMarker objects without a type' do
      expect(@markers.length).to eql 5
      expect(@markers.first.class).to eql PlaceMarker
    end
  end


end
