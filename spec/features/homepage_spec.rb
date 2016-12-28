require_relative 'features_helper'

describe 'Homepage', type: :feature do

  describe 'Fisheries section' do

    describe 'there are fisheries with and without waters' do

      before do
        stub_google_geocode_lat_lng
        stub_google_geocode_address
        @fishery = FactoryGirl.create :fishery_with_waters, published: true
        @fishery_without_waters = FactoryGirl.create :fishery, name: 'fishery with no waters'
        @homepage = PageObjects::Homepage.new
        @homepage.load
      end

      it 'shows only fisheries with waters' do
        expect(page).to have_no_content 'fishery with no waters'
        expect(page).to have_content @fishery.name
      end

    end

  end

end



# end

# describe "Homepage", type: :feature do

#   describe "Add a water" do

#     context "user knows the name of the fishery and clicks yes" do

#       before do
#         @fishery_details = FactoryGirl.build(:fishery)
#         @homepage = PageObjects::Homepage.new
#         @homepage.load
#         @homepage.yes.click
#       end

#       let(:fishery) { Fishery.first }

#       describe "user fills in the fishery form" do

#         before do
#           @homepage.name.set @fishery_details.name
#           @homepage.submit.click
#         end

#         it "creates a fishery with just the fishery name" do
#           expect(fishery.name).to eql @fishery_details.name
#         end

#         it "redirects to 'add a water' on the homepage" do
#           expect(@homepage.current_url).to end_with "/add/water/#{fishery.id}"
#         end

#         it "has a nice message saying that the fishery was created and to add a water" do
#           expect(@homepage.alert).to have_content "#{fishery.name} was successfully create. Please add a water to #{fishery.name}"
#         end

#         it "has an 'add a water to fishery name' section title without fishery name" do
#           expect(@homepage.add_water_section_title.text).to eql "Add a water to #{@fishery_details.name}"
#         end

#       end

#       describe "user clicks the 'don't know!' button" do
#         it "redirects to 'add a water' form on the homepage" do
#           @homepage.unknown.click
#           expect(@homepage.current_url).to end_with "/add/water/#{fishery.id}"
#         end

#       end

#     end

#     context "user doesn't know the fishery name and clicks no" do

#       before do
#         @species    = FactoryGirl.create_list :species, 5
#         @water_type = FactoryGirl.create_list :water_type, 5
#         @homepage        = PageObjects::Homepage.new
#         @homepage.load
#         @homepage.no.click
#       end

#       let(:fishery) { Fishery.first }

#       it "redirects to 'add a water' form on the homepage"   do
#         expect(@homepage.current_url).to end_with "/add/water/#{fishery.id}"
#       end

#       it "has an 'add a water' section title without fishery name" do
#         expect(@homepage.add_water_section_title.text).to eql "Add a water"
#       end

#       context "water form filled out correctly" do

#           before do
#             @homepage_add_water = PageObjects::HomepageAddWater.new
#             @homepage_add_water.name.set 'fishing loch'
#             @homepage_add_water.latitude.set -90
#             @homepage_add_water.longitude.set -180
#             check @species.first.name
#             check @species.last.name
#             choose @water_type.first.category
#             @homepage_add_water.submit.click
#           end

#           let(:water) { Fishery.first.waters.first }

#           it "has a nice message saying that the water was successfully added" do
#             expect(@homepage_add_water.alert).to have_content "#{water.name} was successfully added. You can add another water, if you like."
#           end
#       end

#     end

#     context "water form is filled out correctly" do

#       before do
#         @species    = FactoryGirl.create_list :species, 5
#         @water_type = FactoryGirl.create_list :water_type, 5
#         @fishery    = FactoryGirl.create(:fishery)

#         @homepage_add_water = PageObjects::HomepageAddWater.new
#         @homepage_add_water.load(id: @fishery.id)
#         @homepage_add_water.name.set 'fishing loch'

#         @homepage_add_water.latitude.set -90
#         @homepage_add_water.longitude.set -180
#         check @species.first.name
#         check @species.last.name
#         choose @water_type.first.category
#         @homepage_add_water.submit.click
#       end

#       let(:water) { Fishery.first.waters.first }
#       let(:fishery) { Fishery.first }

#       it "creates a water for the fishery" do
#         expect(water.name).to eql water.name
#       end

#       it "has a nice message saying that the water was successfully added to the fishery" do
#         expect(@homepage_add_water.alert).to have_content "#{water.name} was successfully added to #{fishery.name}. You can add another water to #{fishery.name}, if you like."
#       end
#     end

#     context "water form is filled out incorrectly" do

#       before do
#         @fishery    = FactoryGirl.create(:fishery)

#         @homepage_add_water = PageObjects::HomepageAddWater.new
#         @homepage_add_water.load(id: @fishery.id)
#         @homepage_add_water.latitude.set -90
#         @homepage_add_water.longitude.set -180
#         @homepage_add_water.submit.click
#       end

#       it "shows a helpful validation messages for required fields" do
#         expect(@homepage_add_water.alert).to have_content "3 errors prohibited this water from being saved: Water name can't be blank You need to select at least one fish species You need to select a water type"
#       end
#   end
# end

# end
