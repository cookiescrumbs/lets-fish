require 'rails_helper'

describe "Fisheries", :type => :request do
  describe "Manage fisheries" do
      it "lists all fisheries" do
        FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery")
        visit admin_fisheries_path
        expect(page).to have_content "Stevo's Big trout fishery"
      end

      it "Create a fishery and show the results" do
        visit admin_fisheries_path
        click_link 'New Fishery'

        fill_in 'fishery_name', :with => "Bob's mega fishy fishery"
        fill_in 'fishery_contact_name', :with => "Bob is the contact name"
        fill_in 'fishery_lat_lng', :with => "54.43869834845736, -2.2472353515624945"
        fill_in 'fishery_street', :with => "Fishery Street"
        fill_in 'fishery_line2', :with => "Fishery line 2"
        fill_in 'fishery_region', :with => "Fishery Region"
        fill_in 'fishery_telephone', :with => "12345678"
        fill_in 'fishery_mobile', :with => "67676767676"
        fill_in 'fishery_email', :with => "bobs@gmail.com"
        fill_in 'fishery_website', :with => "www.bobs.com"
        fill_in 'fishery_postcode', :with => "Fishery Postcode"
        fill_in 'fishery_description', :with => "Three spring-fed trout lakes totalling two acres"
        fill_in 'fishery_prices', with: "8hrs £20 (4 fish); 6hrs £17.50 (3fish);"
        fill_in 'fishery_records', with: "Rainbow 26lb 4oz"
        fill_in 'fishery_season', with: "All season"
        fill_in 'fishery_facilities', with: "Lodge, tackle shop and toilets"

        click_on 'Submit'

        expect(page).to have_content "Bob's mega fishy fishery"
        expect(page).to have_content "Bob is the contact name"
        expect(page).to have_content "Fishery Street"
        expect(page).to have_content "Fishery line 2"
        expect(page).to have_content "Fishery Region"
        expect(page).to have_content "12345678"
        expect(page).to have_content "67676767676"
        expect(page).to have_content "bobs@gmail.com"
        expect(page).to have_content "www.bobs.com"
        expect(page).to have_content "Fishery Postcode"
        expect(page).to have_content "Three spring-fed trout lakes totalling two acres"
        expect(page).to have_content "8hrs £20 (4 fish); 6hrs £17.50 (3fish);"
        expect(page).to have_content "Rainbow 26lb 4oz"
        expect(page).to have_content "All season"
        expect(page).to have_content "Lodge, tackle shop and toilets"

      end

      it "Updates a fishery's details" do
        fishery = FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery")
        visit edit_admin_fishery_path fishery.id
        expect(page.find_field('fishery_name').value).to eql "Stevo's Big trout fishery"

        fill_in "fishery_name", :with => "Dave's Big Trout Fishery"

        click_on 'Submit'
        expect(page).to have_content "Dave's Big Trout Fishery"
      end

      it "Shows an individual fishery's details" do
        fishery = FactoryGirl.create(:fishery)
        visit admin_fishery_path fishery.id
        expect(page).to have_content fishery.name
      end
  end
end


