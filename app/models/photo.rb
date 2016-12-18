class Photo

  attr_accessor :url

  def initialize(&block)
    instance_eval &block if block_given?
  end

end