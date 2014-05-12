require 'spec_helper'

describe "Fisheries" do
  
  context "GET /fisheries" do
    it "displays fisheries" do
      FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery")
      visit fisheries_path
      expect(page).to have_content "Stevo's Big trout fishery"
    end
  end

  context "POST /fisheries" do
    it "create a fisheries" do
      visit fisheries_path
      click_link 'New Fishery'

      fill_in 'fishery_name', :with => "Bob's mega fishy fishery"
      fill_in 'fishery_street', :with => "Fishery Street"
      fill_in 'fishery_line2', :with => "Fishery line 2"
      fill_in 'fishery_city', :with => "Fishery City"
      fill_in 'fishery_region', :with => "Fishery Region"
      fill_in 'fishery_postcode', :with => "Fishery Postcode"

      click_on 'Submit'
      expect(page).to have_content "Bob's mega fishy fishery"
    end

  end

   context "GET /fisheries/1" do
    it "Show a fisheries details" do
      fishery = FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery")
      visit fishery_path fishery.id
      expect(page).to have_content "Stevo's Big trout fishery"
    end
  end

  context "PUT /fisheries/1/edit" do
    it "Updates a fisheries details" do
      fishery = FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery")
      visit edit_fishery_path fishery.id
      expect(page.find_field('fishery_name').value).to eql "Stevo's Big trout fishery"

      fill_in "fishery_name", :with => "Dave's Big Trout Fishery"

      click_on 'Submit'
      expect(page).to have_content "Dave's Big Trout Fishery"
    end
  end

  context "DELETE /fisheries/edit/1" do
    it "Deletes a fisheries details", :js => true do
      fishery = FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery")
      visit fisheries_path
      expect(page).to have_content "Stevo's Big trout fishery"

      click_on 'destroy'
      expect(Fishery.all.count).to eql 0
    end
  end

end
