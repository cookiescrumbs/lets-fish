module MapMarkers
  def self.build(objects:, ext:)
    objects.map do | obj |
      marker = Marker.new do
        self.id = obj.id
        self.lat = obj.lat
        self.lng = obj.lng
        self.name = obj.name
        self.types = obj.types if obj.respond_to? 'types'
      end
      marker.extend(ext)
    end
  end
end