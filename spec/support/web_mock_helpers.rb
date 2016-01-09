module WebMockHelpers
  module GoogleApis
    def stub_google_geocode
      body = File.read("spec/fixtures/googleapis/geocode/manchester.json")
      stub_request(:get, /http:\/\/maps.googleapis.com\/maps\/api\/geocode\/json\?language=en&latlng=(\-?\d+(\.\d+)?),\s*(\-?\d+(\.\d+)?)&sensor=false/).
         to_return(:status => 200, :body => body, :headers => {})
    end
    def stub_google_geocode_address
      body = File.read("spec/fixtures/googleapis/geocode/manchester.json")
      stub_request(:get, "http://maps.googleapis.com/maps/api/geocode/json?address=manchester&language=en&sensor=false").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => body, :headers => {})
    end
    def stub_google_place_details(place_id)
      body = File.read("spec/fixtures/googleapis/place/details/curleys_fishery.json")
      stub_request(:get, "https://maps.googleapis.com/maps/api/place/details/json?key=AIzaSyBPbxg6pkw4DGWeXdWsv6JGpLPikkKyqPY&language=en&placeid=#{place_id}").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
         to_return(:status => 200, :body => body, :headers => {})
    end
  end
end
