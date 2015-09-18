require_relative '../features_helper'

describe "Manage waters page", type: :feature do

  before(:each) do
    login FactoryGirl::create :user
  end

  context "there is a fishery with waters" do

    before(:each) do
      @species    = FactoryGirl.create_list :species, 4
      @water_type = FactoryGirl.create_list :water_type, 4
      @fishery    = FactoryGirl.create :fishery_with_waters
      visit admin_fishery_waters_path @fishery.id
    end

    let(:water){ @fishery.waters.first }
    let(:checked_species_name){ @species.last.name }
    let(:first_species_name){ @species.first.name }
    let(:edit_button){ page.all('.edit').first }
    let(:number_of_waters){ @fishery.waters.count }

    it "lists a fisheries waters" do
      expect(page.all('table tr.water').count).to eql number_of_waters
    end

    it "has a link to create a new water" do
      expect(page).to have_link 'New Water', href: new_admin_fishery_water_path(@fishery)
    end

    it "has the name of the fishery on the page" do
      expect(page).to have_content "#{@fishery.name.possessive} waters"
    end

    it "can delete a water with a nice message" do
      name = water.name
      first_water = page.all('.destroy').first
      expect {first_water.click}.to change(@fishery.waters, :count).from(5).to(4)
      expect(page.find('.alert')).to have_content "#{name} was successfully deleted"
    end

    describe "a water can be edited" do

      it "has the waters name as a title" do
        edit_button.click
        expect(page.find('h3').text).to eql "#{@fishery.name.possessive} - #{water.name}"
      end

      it "has the correct fields in the edit form" do
        edit_button.click
        expect(page.find_field('water_name').value).to eql water.name
        expect(page.find('#latitude').value.to_f).to eql water.latitude
        expect(page.find('#longitude').value.to_f).to eql water.longitude
        expect(page.has_checked_field? checked_species_name).to be true
      end

      it "updates a waters details and returns a nice message" do
        edit_button.click
        fill_in 'water_name', with: 'loch dooooooon'
        #had to use find as the fields are hidden
        find('#latitude').set -90
        find('#longitude').set -180
        check first_species_name
        click_on 'Submit'
        expect(page).to have_content 'loch dooooooon'
        expect(page).to have_content "#{checked_species_name}, #{first_species_name}"
        expect(page.find('.alert')).to have_content "loch dooooooon was successfully updated."
      end

      it "shows a helpful validation messages for required fields" do
        edit_button.click

        fill_in 'water_name', with: ''
        #had to use find as the fields are hidden
        # find('#latitude').set ''
        # find('#longitude').set ''

        click_on "Submit"

        expect(page.find('.alert')).to have_content "1 error prohibited this water from being saved: Water name can't be blank"
      end

    end

  end

  context "there is a fishery without waters" do

    before(:each) do
      @fishery_without_waters = FactoryGirl.create :fishery
      visit admin_fishery_waters_path @fishery_without_waters.id
    end

    it "has a lovely message telling you to create a water" do
      expect(page).to have_content "There are no waters associated with this fishery. Please add a water."
    end

    it "doesn't have a table of waters" do
      expect(page).to have_no_css 'table.waters'
    end

  end

end
