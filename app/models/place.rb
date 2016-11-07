class Place
  attr_accessor :id, :name

  def initialize(&block)
    instance_eval &block if block_given?
  end

end