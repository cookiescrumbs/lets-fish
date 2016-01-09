class GooglePlace
  #Geocoder.search("ChIJU-yKTZRWh0gRp3-0rlClmc8", :lookup => :google_places_details).first.formatted_address
  attr_reader :place
  def initialize(place_id)
    @place = Geocoder.search(place_id, :lookup => :google_places_details).first
    build_address place.address_components
  end

  def build_address(address_components)
    address = {}
    address_components
    # address_components.each do |component|
    # end
  end

end

