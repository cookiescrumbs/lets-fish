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

    end

    context "form is filled out incorrectly" do

      before do
        @homepage = PageObjects::Homepage.new
        @homepage.load
        @homepage.submit.click
      end

      it "shows a helpful validation messages for required fields" do
        expect(@homepage.alert).to have_content "1 error prohibited this fishery from being saved: Fishery Name can't be blank"
      end

    end

  end

  describe "Add a water to a fishery" do

    context "water form is filled out correctly" do

      before do
        @fishery    = FactoryGirl.create(:fishery)
        @water      = FactoryGirl.build(:water)
        @species    = FactoryGirl.create_list :species, 5

        @homepage_add_water = PageObjects::HomepageAddWater.new
        @homepage_add_water.load(id: @fishery.id)
        @homepage_add_water.name.set @water.name
        @homepage_add_water.latitude.set -90
        @homepage_add_water.longitude.set -180
        check @species.first.name
        check @species.last.name
        @homepage_add_water.submit.click
      end

      let(:water) { Fishery.first.waters.first }

      it "creates a water for the fishery" do
        expect(water.name).to eql @water.name
      end

    end
  end

end
