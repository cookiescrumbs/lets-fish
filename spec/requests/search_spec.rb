describe "Search API", type: :request do

  before(:each) do
    stub_google_geocode
    FactoryGirl.create_list :species, 5
    FactoryGirl.create_list :water_type, 5
    FactoryGirl.create_list :water, 2, latitude: 53.501942, longitude: -2.245983
  end

  it "GET /search with bounds" do

    params = {
      bounds: [53.39990299999999,-2.3000969,53.5445879,-2.1470875]
    }

    get '/search', params, { "Accept" => "application/json" }

    expect(response).to be_success
    expect(json.length).to eq 2
    expect(json['markers'].first['name']).to eql waters.first.name
  end

  it "GET /search without bounds" do

    params = {
      lat: 53.501942,
      lng: -2.245983
    }

    get '/search', params, { "Accept" => "application/json" }

    expect(response).to be_success
    expect(json.length).to eq 2
    expect(json['markers'].first['name']).to eql waters.first.name
  end

  it "GET /search with location only" do
    stub_google_geocode_address
    params = {
      location: 'manchester'
    }

    get '/search', params, { "Accept" => "application/json" }

    expect(response).to be_success
    expect(json.length).to eq 2
    expect(json['markers'].first['name']).to eql waters.first.name
  end


end
