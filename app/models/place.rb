class Place

  attr_accessor :lat, :lng, :name, :types, :id, :address, :telephone, :website, :reviews, :photos, :rating

  def initialize(&block)
    instance_eval &block if block_given?
  end

  def stars
    self.rating.round unless rating.nil?
  end


end