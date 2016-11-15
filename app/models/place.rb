class Place

  attr_accessor :id, :lat, :lng, :name, :types, :address, :telephone, :website, :reviews, :photos, :rating

  def initialize(&block)
    instance_eval &block if block_given?
  end

  def stars
    self.rating.round unless rating.nil?
  end

end