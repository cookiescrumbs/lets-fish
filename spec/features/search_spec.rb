require_relative 'features_helper'

describe "Search", type: :feature, focus: true do

  context "with the url params location, lat and lng" do
    before do
      @search = PageObjects::Search.new
      @search.load(query: {
      location: 'Manchester',
      lat: ,
      lng:
      })
    end

    it "has a page route" do
      expect(@search.status_code).to eql 200
    end

    it "has a map" do
      expect(@search).to have_map
    end

    it "has a result list of waters" do
      binding.pry
    end

  end

end
