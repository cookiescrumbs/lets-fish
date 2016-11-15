class Marker

  attr_accessor :id, :name, :lat, :lng

  def initialize(id:, lat:, lng:, name:)
    @id = id
    @lat = lat
    @lng = lng 
    @name = name
  end

end