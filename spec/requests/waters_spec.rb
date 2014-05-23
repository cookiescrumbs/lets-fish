require 'spec_helper'

describe "Waters" do
   
   context "GET /waters" do
    it "displays waters" do
      FactoryGirl.create(:water, name: "Fishing Loch", lng: "55.904503" , lat: "-5.941418" )
      visit waters_path
      expect(page).to have_content "Fishing Loch"
      expect(page).to have_content "55.904503,-5.941418"
    end
  end

end
