require 'map_markers'

describe MapMarkers::Places, '.build' do

  before(:each) do
    places = [*1..5].map do
      Place.new do
        self.id = 1233456
        self.lat = 56.002120300185574
        self.lng = -5.958730311373353
        self.name = 'My Place',
        self.types = ['lodging', 'establishment', 'site_of_interest']
      end
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
        Place.new do
          self.id = 1233456
          self.lat = 56.002120300185574
          self.lng = -5.958730311373353
          self.types = ['lodging', 'establishment', 'site_of_interest']
        end
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