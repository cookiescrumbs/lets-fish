describe "Search API", type: :request do

  before(:each) do
    FactoryGirl.create_list :species, 5
    FactoryGirl.create_list :water_type, 5
    FactoryGirl.create_list :water, 2, latitude: 54.43869834845736, longitude: -2.2472353515624945
    FactoryGirl.create_list :water, 5

  end

  it "POST /search with bounds" do

    params = {
      bounds: [ 50.372397505869166, -9.495465332031245, 56.266804507181014, 6.1051206054687555],
      lat: 54.43869834845736,
      lng: -2.2472353515624945
    }

    post '/search', params, { "Accept" => "application/json" }

    expect(response).to be_success
    expect(json.length).to eq 2
    expect(json['markers'].first['name']).to eql waters.first.name
  end

  it "POST /search without bounds" do

    params = {
      lat: 54.43869834845736,
      lng: -2.2472353515624945
    }

    post '/search', params, { "Accept" => "application/json" }

    expect(response).to be_success
    expect(json.length).to eq 2
    expect(json['markers'].first['name']).to eql waters.first.name
  end

end
