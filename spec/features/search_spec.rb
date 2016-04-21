require_relative 'features_helper'

describe "Search", type: :feature do

  describe "for a fishery in Manchester" do

    context "there is a fishery in Manchester with five waters" do

      before(:each) do
        stub_google_geocode_lat_lng
        stub_google_geocode_address
        @species    = FactoryGirl.create_list :species, 5
        @water_type = FactoryGirl.create_list :water_type, 5
        @fishery    = FactoryGirl.create :fishery_with_waters

        @search = PageObjects::Search.new
        @search.load(
          query: {
            location: 'Manchester, United Kingdom',
            lat: 53.4807593,
            lng: -2.2426305000000184
          }
        )
      end

      it "has a map" do
        expect(@search).to have_map
      end

      it "has results for Manchester" do
        expect(@search.results.count).to eql 5
      end

    end

    context "there are no waters in Manchester" do

      before(:each) do
        @search = PageObjects::Search.new
        @search.load(
          query: {
            location: 'Manchester, United Kingdom',
            lat: 53.4807593,
            lng: -2.2426305000000184
          }
        )
      end

      it "has no results for Manchester" do
        expect(@search.results.count).to eql 0
      end

    end

  end

end
