require 'rails_helper'

describe "Species", :type => :request do
  describe "Manage species" do
      it "Lists all species" do
        FactoryGirl.create(:species, name: "Rainbow trout")
        visit admin_species_index_path
        expect(page).to have_content "Rainbow trout"
      end

      it "Create a species and show the results" do
        visit admin_species_index_path
        fill_in 'species_name', :with => "Rainbow trout"
        click_on 'Create Species'
        expect(page).to have_content "Rainbow trout"
      end

      it "Delete a species" do
        FactoryGirl.create(:species, name: "Rainbow trout")
        visit admin_species_index_path
        click_on 'Destroy'
        expect(page).not_to have_content "Rainbow trout "
      end

      it "Show a species details" do
        FactoryGirl.create(:species, name: "Rainbow trout")
        FactoryGirl.create(:species, name: "Brown trout")
        visit admin_species_index_path
        page.all("a",text: "Show")[0].click
        expect(page).to have_content "Rainbow trout"
        expect(page).not_to have_content "Brown trout"
      end
  end
end