describe 'Search waters with fishery slug', type: :request do
  context 'fishery with published waters' do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      @fishery = FactoryGirl.create_list(:fishery_with_waters, 5, published: true)
    end

    it 'GET /search/waters with fishery slug' do
      params = {
        slug: @fishery.first.slug
      }

      get '/search/waters', params: params, headers: { 'Accept' => 'application/json' }

      expect(response).to be_success
      expect(json['markers'].length).to eq 5
    end
  end

  context 'fishery with unpublished waters' do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      @fishery = FactoryGirl.create_list(:fishery_with_waters, 5, published: false)
    end

    it 'GET /search/waters with fishery slug' do
      params = {
        slug: @fishery.first.slug
      }

      get '/search/waters', params: params, headers: { 'Accept' => 'application/json' }

      expect(response).to be_success
      expect(json['markers'].length).to eq 0
    end
  end
end
