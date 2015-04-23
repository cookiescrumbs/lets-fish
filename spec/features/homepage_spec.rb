require_relative 'features_helper'

describe "Homepage", type: :feature do

  describe "list a fishery" do

    context "form is filled out correctly" do

      before do
        @fishery_details = FactoryGirl.build(:fishery)
        @homepage        = PageObjects::Homepage.new
        @homepage.load
        @homepage.name.set @fishery_details.name
        @homepage.submit.click
      end

      let(:fishery) { Fishery.first }

      it "creates a fishery with just the fishery name" do
        expect(fishery.name).to eql  @fishery_details.name
      end

      it "redirects to 'add a water' on the homepage" do
        expect(@homepage.current_url).to end_with "/add/water/#{fishery.id}"
      end

      it "has a nice message saying that the fishery was created and to add a water" do
        expect(@homepage.alert).to have_content "#{fishery.name} was successfully create. Please add a water to the fishery."
      end

    end

    context "form is filled out incorrectly" do
      before do
        @homepage = PageObjects::Homepage.new
        @homepage.load
        @homepage.submit.click
      end

      it "shows a helpful validation messages for required fields" do
        expect(@homepage.alert).to have_content "1 error prohibited this fishery from being saved: Fishery name can't be blank"
      end

    end

  end

  describe "Add a water to a fishery" do

    context "water form is filled out correctly" do

      before do
        @fishery    = FactoryGirl.create(:fishery)
        @water      = FactoryGirl.build(:water)
        @species    = FactoryGirl.create_list :species, 5
        @water_type = FactoryGirl.create_list :water_type, 5

        @homepage_add_water = PageObjects::HomepageAddWater.new
        @homepage_add_water.load(id: @fishery.id)
        @homepage_add_water.name.set @water.name

        @homepage_add_water.latitude.set -90
        @homepage_add_water.longitude.set -180
        check @species.first.name
        check @species.last.name
        choose @water_type.first.category
        @homepage_add_water.submit.click
      end

      let(:water) { Fishery.first.waters.first }
      it "creates a water for the fishery" do
        expect(water.name).to eql @water.name
      end

      it "has a nice message saying that the water was successfully added to the fishery" do
        expect(@homepage_add_water.alert).to have_content "#{@water.name} was successfully added to #{@fishery.name}. Add another water to #{@fishery.name}."
      end
    end

    context "water form is filled out incorrectly" do

      before do
        @fishery    = FactoryGirl.create(:fishery)

        @homepage_add_water = PageObjects::HomepageAddWater.new
        @homepage_add_water.load(id: @fishery.id)
        @homepage_add_water.latitude.set -90
        @homepage_add_water.longitude.set -180
        @homepage_add_water.submit.click
      end

      it "shows a helpful validation messages for required fields" do
        expect(@homepage_add_water.alert).to have_content "3 errors prohibited this water from being saved: Water name can't be blank You need to select at least one fish species You need to select a water type"
      end

    end



  end

end
