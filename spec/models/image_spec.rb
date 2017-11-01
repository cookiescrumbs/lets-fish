describe Image, type: :model do

  describe 'attribution' do

    it 'should return a Hash' do
      water = FactoryGirl.create :image, attribution: "{\"name\": \"Jimi Hendrix\", \"profile_url\":\"http://www.geograph.org.uk/profile/9715\"}"
      expect(water.attribution).to eql({"name" => "Jimi Hendrix", "profile_url" => "http://www.geograph.org.uk/profile/9715"})
      expect(water.attribution.class).to eql(Hash)
    end

    it 'should return the name' do
      water = FactoryGirl.create :image, attribution: "{\"name\": \"Jimi Hendrix\", \"profile_url\":\"http://www.geograph.org.uk/profile/9715\" }"
      expect(water.attribution['name']).to eql 'Jimi Hendrix'
    end

  end

end
