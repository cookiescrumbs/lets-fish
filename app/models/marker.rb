class Marker

  attr_accessor :id, :name, :lat, :lng, :types

  def initialize(&block)
    instance_eval &block if block_given?
  end

end