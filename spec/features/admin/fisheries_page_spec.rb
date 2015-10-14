require_relative '../features_helper'

describe "Manage fisheries page", type: :feature do

  before(:each) do
    login FactoryGirl.create :user
  end

  context "there is a fishery to manage" do
    before(:each) do
      stub_google_geocode
      @species    = FactoryGirl.create_list :species, 5
      @water_type = FactoryGirl.create_list :water_type, 5
      @fishery    = FactoryGirl.create(:fishery_with_waters, name: "Stevo's Big trout fishery")
    end

    it "updates a fishery's details" do
      visit edit_admin_fishery_path @fishery.id
      expect(page.find_field('fishery-name').value).to eql "Stevo's Big trout fishery"

      fill_in "fishery-name", :with => "Dave's Big Trout Fishery"

      click_on 'Submit'

      expect(page).to have_content "Dave's Big Trout Fishery"
    end

    it "deletes a fishery" do
      visit admin_fisheries_path
      expect {click_on 'destroy'}.to change(Fishery, :count).from(1).to(0)
    end

    it "deletes associated waters" do
      visit admin_fisheries_path
      expect {click_on 'destroy'}.to change(Water, :count).from(5).to(0)
    end

    it "lists all fisheries" do
      visit admin_fisheries_path
      expect(page).to have_content "Stevo's Big trout fishery"
    end

    it "has a link to a fishery's waters" do
      visit admin_fisheries_path
      expect(page).to have_link 'show', href: admin_fishery_waters_path(@fishery)
    end

    it "has a button to add a water to a fishery" do
      visit admin_fisheries_path
      expect(page).to have_link 'add', href: new_admin_fishery_water_path(@fishery)
    end
  end

  context "there are no fisheries to manage" do

    it "has a lovely message telling you to create a fishery" do
      visit admin_fisheries_path
      expect(page).to have_content "There are no fisheries. Please add a fishery."
    end

    it "doesn't have a table of fisheries" do
      expect(page).to have_no_css 'table.waters'
    end


  end

end
