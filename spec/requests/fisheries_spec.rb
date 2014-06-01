require 'spec_helper'

describe "Fishery pages" do
  
  context "index" do
    it "lists all fisheries" do
      FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery")
      visit fisheries_path
      expect(page).to have_content "Stevo's Big trout fishery"
    end
  end

  context "create" do
    it "should create a fishery" do
      visit fisheries_path
      click_link 'New Fishery'

      fill_in 'fishery_name', :with => "Bob's mega fishy fishery"
      fill_in 'fishery_street', :with => "Fishery Street"
      fill_in 'fishery_line2', :with => "Fishery line 2"
      fill_in 'fishery_region', :with => "Fishery Region"
      fill_in 'fishery_telephone', :with => "12345678"
      fill_in 'fishery_postcode', :with => "Fishery Postcode"

      click_on 'Submit'
      expect(page).to have_content "Bob's mega fishy fishery"
    end

  end

  context "show" do
    it "lists a selected fisheries details" do
      fishery = FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery")
      visit fishery_path fishery.id
      expect(page).to have_content "Stevo's Big trout fishery"
    end
  end

  context "edit" do
    it "updates a fisheries details" do
      fishery = FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery")
      visit edit_fishery_path fishery.id
      expect(page.find_field('fishery_name').value).to eql "Stevo's Big trout fishery"

      fill_in "fishery_name", :with => "Dave's Big Trout Fishery"

      click_on 'Submit'
      expect(page).to have_content "Dave's Big Trout Fishery"
    end
  end

  context "delete" do
    it "deletes a fisheries details", :js => true do
      fishery = FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery")
      visit fisheries_path
      expect(page).to have_content "Stevo's Big trout fishery"

      click_on 'destroy'
      expect(Fishery.all.count).to eql 0
    end
  end

end
