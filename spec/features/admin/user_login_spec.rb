require_relative '../features_helper'

describe "User login", type: :feature do

  context "user has an account" do
    before(:each) do
    end
    let(:water){ @fishery.waters.first }
    let(:checked_species_name){ @species.last.name }
    let(:first_species_name){ @species.first.name }
    let(:edit_button){ page.all('.edit').first }
    let(:number_of_waters){ @fishery.waters.count }
    it "shows a helpful validation messages for required fields" do

      fill_in 'water_name', with: ''
      #had to use find as the fields are hidden
      # find('#latitude').set ''
      # find('#longitude').set ''

      click_on "Submit"

      expect(page.find('.alert')).to have_content "1 error prohibited this water from being saved: Water name can't be blank"
    end
  end
end
