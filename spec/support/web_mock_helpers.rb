module WebMockHelpers
  module GoogleApis
    def stub_google_geocode(body=false)
      body = File.read('spec/fixtures/googleapis/geocode/pilcaniyeu_rio_negro_argentina.json') unless body
      stub_request(:get, /http:\/\/maps.googleapis.com\/maps\/api\/geocode\/json\?language=en&latlng=(\-?\d+(\.\d+)?),\s*(\-?\d+(\.\d+)?)&sensor=false/).
         to_return(:status => 200, :body => body, :headers => {})
    end
  end
end
