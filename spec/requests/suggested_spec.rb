describe 'Suggested', type: :request do
  context 'fishery with published waters' do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      @fishery = FactoryGirl.create_list(:fishery_with_waters, 5, published: true)
    end

    it 'GET /suggested/all' do
      get '/suggested/all', params: {}, headers: { 'Accept' => 'application/json' }
        expect(response).to be_success
        expect(json['markers'].length).to eq 5
      end
  end

end
