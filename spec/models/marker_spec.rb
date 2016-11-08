describe Marker, type: :model do

  describe PlaceMarker do
    
    before(:each) do
      @marker = Marker.new do
         self.id = 128318723,
         self.name =  "Cookies Hotel",
         self.types = ['lodging', 'campground', 'point_of_interest', 'establishment']
      end
      @marker.extend(PlaceMarker)
    end

    it 'icon' do
      expect(@marker.icon).to eql 'hotel'
    end
  end

  describe WaterMarker do
    
    before(:each) do
      @marker = Marker.new do
         self.id = 128318723,
         self.name =  "Cookies Hotel"
      end
      @marker.extend(WaterMarker)
    end

    it 'icon' do
      expect(@marker.icon).to eql 'https://chart.googleapis.com/chart?chst=d_map_spin&chld=1|0|fed136|13|_|'
    end
  end

end
