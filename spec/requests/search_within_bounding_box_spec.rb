describe 'Search within bounding box', type: :request do
  before(:each) do
    stub_google_geocode_lat_lng
    stub_google_geocode_address

    ['brown trout', 'rainbow trout', 'grayling', 'sea trout'].map do |name|
      FactoryBot.create :species, name: name
    end

    %w(lake river).map do |category|
      FactoryBot.create :water_type, category: category
    end

    FactoryBot.create_list(
      :water,
      23,
      latitude: 53.501942,
      longitude: -2.245983,
      species: [Species.last],
      water_type_id: WaterType.first.id,
    )
  end

  it 'GET /search/within-bounding-box with bounds' do
    params = {
      bounds: [53.39990299999999, -2.3000969, 53.5445879, -2.1470875]
    }

    get '/search/within-bounding-box', params: params, headers: {'Accept' => 'application/json'}

    expect(response).to be_successful
    expect(json.length).to eq 2
    expect(json['markers'].first['name']).to eql waters.first.name
  end

  it 'GET /search/within-bounding-box limits to 20' do
    params = {
      bounds: [53.39990299999999, -2.3000969, 53.5445879, -2.1470875]
    }

    get '/search/within-bounding-box', params: params, headers: {'Accept' => 'application/json'}

    expect(response).to be_successful
    expect(json['markers'].length).to eq 20
    expect(json['markers'].first['name']).to eql waters.first.name
  end
end
