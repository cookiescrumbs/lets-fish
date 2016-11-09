describe PlaceMarker, type: :model, focus: true do
  before do
    @placeMarker = PlaceMarker.new(
        id: 12345,
        lat: 56.002120300185574,
        lng: -5.958730311373353,
        name: 'Cookie Place',
        types: ['lodging', 'establishment', 'site_of_interest']
    )
  end

  it 'return the name' do
    expect(@placeMarker.name).to eql 'Cookie Place'
  end

  it 'icon' do
    expect(@placeMarker.icon).to eql 'fa-bed'
  end
end
