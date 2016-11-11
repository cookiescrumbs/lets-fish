class InfoWindow

  attr_accessor :body, :footer

  def initialize(&block)
    instance_eval &block if block_given?
  end

end