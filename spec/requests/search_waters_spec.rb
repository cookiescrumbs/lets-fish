describe 'Search', type: :request do

    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address
       @fishery = FactoryGirl.create :fishery_with_waters, published: true
    end

      it 'GET /search/waters with slug'  do
        params = {
          slug: @fishery.slug
        }

        get '/search/waters', params: params, headers: {'Accept' => 'application/json'}

        expect(response).to be_success
        expect(json['markers'].length).to eq 5
      end
  end
