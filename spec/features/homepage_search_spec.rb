require_relative 'features_helper'

describe "Homepage location search", type: :feature, js: true do

  context "user searches for a water" do

    before do
      @homepage = PageObjects::Homepage.new
      @homepage.load
      @homepage.location.set 'manchester uk'
      @homepage.wait_until_google_places_visible
      @homepage.google_places.first.click
      @homepage.click_button('Search')
    end

    it "routes to the search page with correct location in the url" do
      search = PageObjects::Search.new
      search.wait_for_map
      expect(search.current_url).to end_with 'location=Manchester%2C+UK'
    end

  end

end
