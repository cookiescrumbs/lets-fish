class PlaceMarker < Marker

  attr_accessor :types, :type

  def initialize(id:, lat:, lng:, name:, type:)
    super(id: id, lat: lat, lng: lng, name: name)
    @type = type
  end

  def icon
    type_to_icon_mapping[self.type] 
  end

  private

  def type_to_icon_mapping
    {
      'campground' => 'campsite',
      'restaurant' => 'food',
      'bar' => 'drink',
      'lodging' => 'accommodation'
    }
  end
  
end