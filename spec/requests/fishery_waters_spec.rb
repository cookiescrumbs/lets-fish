require 'spec_helper'

describe "Fishery waters" do

  let(:fishery){ FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery") }

  before { visit fishery_path fishery.id }

  it "Displays a selected fishery's details" do
    expect(page).to have_content "Stevo's Big trout fishery"
  end
  
  describe "Manage a fishery's waters" do

    describe "Create a water for a fishery" do

      context "with invalid information" do
        it "should not create a new water" do
          expect { click_on 'Submit' }.not_to change(Water, :count)
        end
      end

      context "with valid information" do
        before do
          fill_in 'water_name', :with => "Greenfield Reservoir"
          fill_in 'water_longitude', :with => 53.531054
          fill_in 'water_latitude', :with => -1.975955
        end
        it "should create a new water" do
          expect { click_on 'Submit' }.to change(Water, :count).by(1)
        end
      end

    end

    it "Updates a waters details" do
      pending "reason"
    end

    it "Deletes a water from a fishery", :js => true do
      pending 
    end

  end
end
