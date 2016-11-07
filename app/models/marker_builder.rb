module MarkerBuilder

  def self.build(data:)
    Marker.new do
      self.id = data.id || nil
      self.lat =  data.lat || nil
      self.lng = data.lng || nil
      self.name = data.name || nil
      self.icon = data.icon || nil
    end
  end

end