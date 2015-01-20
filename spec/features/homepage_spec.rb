require_relative 'requests_helper'

describe "Homepage", type: :feature do
  

  describe "list a fishery" do
    
    context "form is filled out correctly", focus: true do
    
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

  end

end