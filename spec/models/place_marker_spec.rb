describe PlaceMarker, type: :model do

  before do
    @placeMarker = PlaceMarker.new(
        id: 12345,
        lat: 56.002120300185574,
        lng: -5.958730311373353,
        name: 'Cookie Place',
        type: 'lodging'
    )
  end

  it 'returns the name' do
    expect(@placeMarker.name).to eql 'Cookie Place'
  end

  it 'icon' do
    expect(@placeMarker.icon).to eql 'accommodation'
  end
end
