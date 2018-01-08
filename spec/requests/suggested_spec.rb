describe 'Suggested', type: :request, focus: true do
  context 'fishery with published waters' do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      FactoryGirl.create_list(:fishery_with_waters, 2, published: true)
    end

    it 'GET /suggested/all' do
      get '/suggested/all', params: {}, headers: { 'Accept' => 'application/json' }
        expect(response).to be_success
        expect(json.length).to eq 12
    end
  end
end
