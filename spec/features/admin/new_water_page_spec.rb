require_relative '../features_helper'

describe "New water page", type: :feature do

  before :each do
    login FactoryGirl.create :user

    stub_google_geocode_lat_lng
    stub_google_geocode_address

    @species    =  ["brown trout", "rainbow trout", "grayling", "sea trout"].map do |name|
      FactoryGirl.create :species, name: name
    end

    @water_type = ["lake", "river"].map do |category|
      FactoryGirl.create :water_type, category: category
    end

    @fishery = FactoryGirl.create :fishery, name: "Bob's big fishery"
    visit new_admin_fishery_water_path @fishery.slug
  end

  it "has the name of the fishery" do
    expect(page).to have_content "New water for Bob's big fishery"
  end

  context "form is filled out correctly" do

    it "adds a water to a fishery, shows the water's details and says a nice thing" do

      fill_in 'water_name', with: "Total Loch Doon"
      #had to use find as the fields are hidden
      find('#latitude').set -90
      find('#longitude').set -180
      check @species.first.name
      check @species.last.name
      choose @water_type.first.category
      attach_file('file', File.join(Rails.root, 'spec/fixtures/files/another-loch.jpg'))
      find('#image_geograph_photo_id').set 987654

      click_on "Submit"

      expect(page).to have_content "Total Loch Doon"
      expect(page).to have_content [@species.first.name , @species.last.name].to_sentence
      expect(page).to have_content @water_type.first.category
      expect(page.find('.alert')).to have_content "#{@fishery.waters.last.name} was successfully added to #{@fishery.name}"
      expect(@fishery.waters.last.images.first.geograph_photo_id).to eql 987654

    end

  end

  context "form is filled out incorrectly" do

    it "shows a helpful validation messages for required fields" do

      fill_in 'water_name', with: ''
      #had to use find as the fields are hidden
      find('#latitude').set -90
      find('#longitude').set -180
      click_on "Submit"

      expect(page.find('.alert')).to have_content "3 errors prohibited this water from being saved: Water name can't be blank You need to select at least one fish species You need to select a water type"
    end

  end


end
