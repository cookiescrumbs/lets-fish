describe 'Suggested', type: :request do
  context 'Two fisheries with five published waters each' do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      FactoryBot.create_list(:fishery_with_waters, 2, published: true)
    end

    it 'GET /suggested/all' do
      get '/suggested/all', params: {}, headers: { 'Accept' => 'application/json' }
      expect(response).to be_success
      expect(json.length).to eq 12
    end

    it 'GET /suggested/waters' do
      get '/suggested/waters', params: {}, headers: { 'Accept' => 'application/json' }
      expect(response).to be_success
      expect(json.length).to eq 10
    end

    it 'GET /suggested/fisheries' do
      get '/suggested/fisheries', params: {}, headers: { 'Accept' => 'application/json' }
      expect(response).to be_success
      expect(json.length).to eq 2
    end
  end
end
