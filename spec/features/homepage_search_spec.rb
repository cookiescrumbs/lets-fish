require_relative 'features_helper'

describe "Homepage", type: :feature do

  context "user searches for a water and clicks submit " do
    before do
      @homepage = PageObjects::Homepage.new
      @homepage.load
      @homepage.search.set 'Manchester'
      @homepage.submit_search.click
    end

    it "routes to the search page with correct parameters in the url" do
      expect(@homepage.current_url).to end_with "location=Manchester&lat=&lng="
    end
  end

end
