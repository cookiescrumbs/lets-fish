describe "Waters API", type: :request do
  it "POST /within_bounding_box" do

      FactoryGirl.create_list :species, 5
      FactoryGirl.create_list :water_type, 5
      FactoryGirl.create :water, latitude: 54.43869834845736, longitude: -2.2472353515624945
      FactoryGirl.create :water, latitude: 54.43869834845736, longitude: -2.2472353515624945
      FactoryGirl.create :water
      FactoryGirl.create :water

      bounds = { bounds: [ 50.372397505869166, -9.495465332031245, 56.266804507181014, 6.1051206054687555] }

      post '/waters/within_bounding_box', bounds, { "Accept" => "application/json" }

      expect(response).to be_success
      expect(json.length).to eq 2
      expect(json.first['name']).to eql waters.first.name
  end
end
