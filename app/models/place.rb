class Place
  attr_accessor :id, :name, :types

  def initialize(&block)
    instance_eval &block if block_given?
  end


  def type_icon

    icons = {
      'lodging' => 'hotel',
      'campground' => 'camping'
    }

    self.types.each do | type |
      if icons[type]
        return icons[type]
        break
      end

    end

  end

  def type
    self.class.name

  end
end