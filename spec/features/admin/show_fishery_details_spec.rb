require_relative '../requests_helper'

describe "Show fishery details page", type: :feature do

    before(:each) do
      @fishery = FactoryGirl.create(:fishery)
      visit admin_fishery_path @fishery.id
    end

    it "has a name" do
      expect(page).to have_content @fishery.name
    end

end