describe 'Weather API', type: :request, focus: true do

    before(:each) do
      stub_dark_sky
    end

  it 'GET /weather using lat,lng' do
    params = {
      lat: 37.8267,
      lng: -122.4233
    }

    get '/weather', params, 'Accept' => 'application/json'

    expect(response).to be_success
    expect(json['forecast']['lat']).to eql 37.8267
    expect(json['forecast']['lng']).to eql -122.4233
    expect(json['forecast']['wind_speed']).to eql 2.71
    expect(json['forecast']['wind_bearing']).to eql 162
    expect(json['forecast']['wind_direction']).to eql 'SSE'
  end
end