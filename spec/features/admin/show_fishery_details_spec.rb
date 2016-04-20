require_relative '../features_helper'

describe "Show fishery details page", type: :feature do

    before(:each) do
      login FactoryGirl.create :user

      @fishery = FactoryGirl.create(:fishery)
      visit admin_fishery_path @fishery.slug
    end

    it "has a name" do
      expect(page).to have_content @fishery.name
    end

end
