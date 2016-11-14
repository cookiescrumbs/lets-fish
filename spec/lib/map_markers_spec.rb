require 'map_markers'

describe MapMarkers::Places, '.build' do
  Place = Struct.new(:id, :name, :lat, :lng, :types)

  before(:each) do
    places = [*1..5].map do
      Place.new(id: 12345, name: 'a name', lat: 54.665559, lng: -2.299508, types: ['lodging', 'establishment', 'site_of_interest'])
    end
    type = 'lodging'
    @markers = MapMarkers::Places::build(places, type)
  end

  it 'returns an array of PlaceMarker objects' do
    expect(@markers.length).to eql 5
    expect(@markers.first.class).to eql PlaceMarker
  end

  context 'missing data' do
    before(:each) do
      places = [*1..5].map do
        Place.new(id: 12345, lat: 54.665559, lng: -2.299508)
      end
      type = 'lodging'
      @markers = MapMarkers::Places::build(places, type)
    end

    it 'returns an array of PlaceMarker objects with name missing' do
      expect(@markers.length).to eql 5
      expect(@markers.first.class).to eql PlaceMarker
      expect(@markers.first.name).to eql nil
    end
  end

end