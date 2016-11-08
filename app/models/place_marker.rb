module PlaceMarker

  def icon
    self.types.each do | type |
      if type_to_icon_mapping[type]
        return type_to_icon_mapping[type]
        break
      end
    end
  end

  private

  def type_to_icon_mapping
    {
      'lodging' => 'fa-bed',
      'campground' => 'fa-free-code-camp'
    }
  end 
end