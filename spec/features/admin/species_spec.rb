require_relative '../features_helper'

describe "Species", type: :feature do

  before(:each) do
    login FactoryGirl.create :user
  end

  describe "Manage species" do


      it "lists all species" do
        FactoryGirl.create(:species, name: "Rainbow trout")
        visit admin_species_index_path
        expect(page).to have_content "Rainbow Trout"
      end

      it "create a species and show the results" do
        visit admin_species_index_path
        fill_in 'species_name', :with => "Rainbow trout"
        click_on 'Submit'
        expect(page).to have_content "Rainbow Trout"
      end

      it "delete a species" do
        FactoryGirl.create(:species, name: "Rainbow trout")
        visit admin_species_index_path
        click_on 'Destroy'
        expect(page).not_to have_content "Rainbow Trout "
      end

      it "show a species details" do
        FactoryGirl.create(:species, name: "Rainbow trout")
        FactoryGirl.create(:species, name: "Brown trout")
        visit admin_species_index_path
        page.all("a",text: "Show")[0].click
        expect(page).to have_content "Rainbow Trout"
        expect(page).not_to have_content "Brown Trout"
      end
  end
end
