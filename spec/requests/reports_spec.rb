require 'spec_helper'

describe "Reports" do

  context "GET /reports" do
    it "displays reports" do
      FactoryGirl.create(:report, todays_fishing: "Was amazing! Best day so far this season")
      visit reports_path
      expect(page).to have_content "Was amazing! Best day so far this season"
    end
  end

end
