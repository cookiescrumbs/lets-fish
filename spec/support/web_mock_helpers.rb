module WebMockHelpers
  module GoogleApis
    def stub_google_geocode
      body = File.read("spec/fixtures/googleapis/geocode/manchester.json")
      stub_request(:get, /https:\/\/maps.googleapis.com\/maps\/api\/geocode\/json\?key=AIzaSyAbQz9wmM_wnPdi4Q8-dlbDOyDeS10zb58&language=en&latlng=(\-?\d+(\.\d+)?),\s*(\-?\d+(\.\d+)?)&sensor=false/).
         to_return(:status => 200, :body => body, :headers => {})
    end
    def stub_google_geocode_address
      body = File.read("spec/fixtures/googleapis/geocode/manchester.json")
      stub_request(:get, "https://maps.googleapis.com/maps/api/geocode/json?address=manchester&key=AIzaSyAbQz9wmM_wnPdi4Q8-dlbDOyDeS10zb58&language=en&sensor=false").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => body, :headers => {})
    end

    def stub_geograph_photo_details
      body = File.read("spec/fixtures/geograph/photo-details.json")
      stub_request(:get, "http://api.geograph.org.uk/api/photo/158570?key=1234apikey&output=json").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => body , :headers => {'Content-Type' => 'application/json', })

    end
  end
end
