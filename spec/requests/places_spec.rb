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
    expect(json.length).to eq 1
    # expect(json['markers'].first['name']).to eql waters.first.name
  end
end
