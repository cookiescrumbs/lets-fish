require 'map_markers'

describe MapMarkers, '.build' do

  before(:each) do
    Place = Struct.new(:id, :name, :lat, :lng)
    places = [*1..5].map do
      Place.new(id: 12345, name: 'a name', lat: 54.665559, lng: -2.299508)
    end
    @markers = MapMarkers::build(objects: places, ext: PlaceMarker)
  end

  it 'returns an array of Marker objects' do
    expect(@markers.length).to eql 5
    expect(@markers.first.class).to eql Marker
  end

end

