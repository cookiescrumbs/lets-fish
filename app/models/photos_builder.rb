module PhotosBuilder
  def self.build(photos)
    photos.map do | photo |
      next if photo['user']['id'] != '245561560'
      Photo.new do
        self.url = photo['images']['standard_resolution']['url']
      end
    end.compact
  end
end