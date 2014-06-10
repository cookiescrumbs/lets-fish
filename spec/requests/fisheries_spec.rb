require 'spec_helper'

describe "Fisheries" do
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

      it "Deletes a fishery and associated waters", :js => true do
        fishery = FactoryGirl.create(:fishery_with_waters)
        expect(fishery.waters.count).to eql 5
        visit fisheries_path
        expect { click_on 'destroy' }.to change(Fishery, :count).from(1).to(0)
        expect(Water.all.count).to eql 0
      end
  end
end

