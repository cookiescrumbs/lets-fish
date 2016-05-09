require_relative 'features_helper'

describe "Water page", type: :feature do

  describe "Some random fishery with waters" do

    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      @species    = FactoryGirl.create_list :species, 5
      @water_type = FactoryGirl.create_list :water_type, 5
      @fishery    = FactoryGirl.create :fishery_with_waters

      visit "/waters/upper-roddlesworth-reservoir"
      # visit waters @fishery.waters.last.slug

      binding.pry
    end

    let(:water){ @fishery.waters.last }

    describe "meta tags are set" do

      it "has the correct title" do

      end

      it "has the correct description" do

      end

    end

  end

end
