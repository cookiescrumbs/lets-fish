class InfoWindow

  attr_accessor :body
  
  def initialize(&block)
    instance_eval &block if block_given?
  end

end