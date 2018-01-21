describe Api::V1, type: :request do

  describe 'Waters' do

    before(:each) do
      # stub for when the fishery is created
      stub_google_geocode_address
      # stub for when the water is created
      stub_google_geocode_lat_lng

      species = FactoryGirl.create :species
      water_type = FactoryGirl.create :water_type
      @fishery = FactoryGirl.create :fishery

      @params = {
        water: {
          name: 'loch blah blah',
          description: 'this is a loch description',
          latitude: Faker::Address.latitude,
          longitude: Faker::Address.longitude,
          water_type_id: water_type.id,
          species_ids: [species.id]
        }
      }
    end

    let(:latitude) { @params[:water][:latitude] }
    let(:longitude) { @params[:water][:longitude] }
    let(:water_name) { @params[:water][:name] }
    let(:water_description) { @params[:water][:description] }
    let(:fishery_slug) { @fishery.slug }
    let(:fishery_name) { @fishery.name }

    it 'POST /water/fishery/#slug' do
      post "/api/water/fishery/#{fishery_slug}", params: @params, headers: { 'Accept' => 'application/json' }

      expect(response).to be_success
      expect(response.status).to eql 200
      expect(response.body).to include "Successfully added #{water_name} to #{fishery_name}"
      expect(response.body).to include(
        water_name,
        water_description,
        latitude,
        longitude
      )
    end
  end
end
