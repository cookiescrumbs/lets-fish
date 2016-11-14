describe 'PlacesAPI', type: :request do
  before(:each) do
    stub_google_places_near_by_search
  end

  it 'GET /places with bounds' do
    params = {
      lat: 54.673440,
      lng: -2.228462,
      type: 'lodging'
    }

    get '/places', params, 'Accept' => 'application/json'

    expect(response).to be_success
    expect(json['markers'].length).to eq 20
    expect(json['markers'][0]['id']).to eql 'ChIJ7d1Td5YwfEgRpNYMczj3lLs'
    expect(json['markers'][0]['name']).to eql 'The Rose & Crown at Romaldkirk'
    expect(json['markers'][0]['lat']).to eql 54.59390500000001
    expect(json['markers'][0]['lng']).to eql -2.009792
    expect(json['markers'][0]['icon']).to eql 'accommodation'
  end
end
