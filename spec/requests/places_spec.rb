describe 'PlacesAPI', type: :request do

  describe 'GET /places with lat, lng and place type' do

    before(:each) do
      stub_google_places_near_by_search

      params = {
        lat: 54.673440,
        lng: -2.228462,
        type: 'lodging'
      }

      get '/places', params, 'Accept' => 'application/json'
    end

    it 'returns an array of places' do
      expect(response).to be_success
      expect(json['markers'].length).to eq 20
      expect(json['markers'][0]['id']).to eql 'ChIJ7d1Td5YwfEgRpNYMczj3lLs'
      expect(json['markers'][0]['name']).to eql 'The Rose & Crown at Romaldkirk'
      expect(json['markers'][0]['lat']).to eql 54.593905
      expect(json['markers'][0]['lng']).to eql -2.009792
      expect(json['markers'][0]['icon']).to eql 'accommodation'
    end
  end


  describe 'GET /places/info-window with a place id' do

    before(:each) do
      stub_google_places_details

      params = {
        id: 'ChIJXxOaekeBe0gRMJYBk_tTT1I'
      }

      get '/places/info-window', params, 'Accept' => 'application/json'
    end

    it 'returns a single places details as html' do
      expect(response).to be_success
      expect(json["infoWindow"]).to eql "<strong>Stocks Fly Fishery</strong>\n<br>\nCatlow Rd, Slaidburn, Clitheroe BB7 3AQ, United Kingdom\n<br>\n01200 446602\n<br>\n<a href=\"http://stocksreservoir.com/\" target=\"_blank\">http://stocksreservoir.com/</a>\n<br>\n\n"
    end

  end

end
