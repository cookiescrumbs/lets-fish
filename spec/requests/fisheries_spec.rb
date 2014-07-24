require 'rails_helper'

describe "Fisheries", :type => :request do
  describe "Manage fisheries" do
      it "lists all fisheries" do
        FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery")
        visit fisheries_path
        expect(page).to have_content "Stevo's Big trout fishery"
      end

      it "Create a fishery and show the results" do
        visit fisheries_path
        click_link 'New Fishery'

        fill_in 'fishery_name', :with => "Bob's mega fishy fishery"
        fill_in 'fishery_street', :with => "Fishery Street"
        fill_in 'fishery_line2', :with => "Fishery line 2"
        fill_in 'fishery_region', :with => "Fishery Region"
        fill_in 'fishery_telephone', :with => "12345678"
        fill_in 'fishery_postcode', :with => "Fishery Postcode"
        fill_in 'fishery_prices', with: "8hrs £20 (4 fish); 6hrs £17.50 (3fish);"

        click_on 'Submit'
        expect(page).to have_content "Bob's mega fishy fishery"
      end

      it "Updates a fishery's details" do
        fishery = FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery")
        visit edit_fishery_path fishery.id
        expect(page.find_field('fishery_name').value).to eql "Stevo's Big trout fishery"

        fill_in "fishery_name", :with => "Dave's Big Trout Fishery"

        click_on 'Submit'
        expect(page).to have_content "Dave's Big Trout Fishery"
      end
  end
end

