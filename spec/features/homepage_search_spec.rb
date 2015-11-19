require_relative 'features_helper'

describe "Homepage location search", type: :feature, js: true do

  context "user searches for a water and clicks submit " do

    before do
      @homepage = PageObjects::Homepage.new
      @homepage.load
      @homepage.location.set 'man'
      @homepage.wait_until_google_places_visible
      @homepage.google_places.first.click
      @homepage.wait_for_lat
      @homepage.wait_for_lng
    end

    it "routes to the search page with correct location, lat and lng parameters in the url" do
      search = PageObjects::Search.new
      search.wait_for_map
      expect(search.current_url).to end_with 'location=Manchester%2C+United+Kingdom&lat=53.4807593&lng=-2.2426305000000184'
    end

  end

end
