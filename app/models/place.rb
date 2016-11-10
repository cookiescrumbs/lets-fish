class Place

  attr_accessor :lat, :lng, :name, :types, :place_id, :formatted_address, :formatted_phone_number

  def initialize(&block)
    instance_eval &block if block_given?
  end

end