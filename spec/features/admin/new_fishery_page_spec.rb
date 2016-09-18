# require_relative '../features_helper'

# describe 'New fishery page', type: :feature do
#   before(:each) do
#     stub_google_geocode_address

#     login FactoryGirl.create :user
#   end

#   context 'form is filled out correctly' do
#     before do
#       @fishery_details         = FactoryGirl.build(:fishery)

#       @new_fishery             = PageObjects::NewFishery.new

#       @new_fishery.load

#       @new_fishery.name.set                        @fishery_details.name
#       @new_fishery.place_id.set                    @fishery_details.place_id

#       @new_fishery.contact_details.name.set        @fishery_details.contact_details.name
#       @new_fishery.contact_details.telephone.set   @fishery_details.contact_details.telephone
#       @new_fishery.contact_details.mobile.set      @fishery_details.contact_details.mobile
#       @new_fishery.contact_details.email.set       @fishery_details.contact_details.email
#       @new_fishery.contact_details.website.set     @fishery_details.contact_details.website

#       @new_fishery.address.postcode.set            @fishery_details.address.postcode
#       @new_fishery.address.street.set              @fishery_details.address.street
#       @new_fishery.address.line2.set               @fishery_details.address.line2
#       @new_fishery.address.region.set              @fishery_details.address.region
#       @new_fishery.address.country.set             @fishery_details.address.country

#       @new_fishery.submit.click
#     end

#     it 'creates a fishery with contact details and address' do
#       fishery         = Fishery.first

#       contact_details = fishery.contact_details
#       address         = fishery.address

#       expect(fishery.name).to               eql   @fishery_details.name
#       expect(fishery.place_id).to           eql   @fishery_details.place_id

#       expect(contact_details.name).to       eql   @fishery_details.contact_details.name
#       expect(contact_details.telephone).to  eql   @fishery_details.contact_details.telephone
#       expect(contact_details.mobile).to     eql   @fishery_details.contact_details.mobile
#       expect(contact_details.email).to      eql   @fishery_details.contact_details.email
#       expect(contact_details.website).to    eql   @fishery_details.contact_details.website

#       expect(address.postcode).to           eql   @fishery_details.address.postcode
#       expect(address.street).to             eql   @fishery_details.address.street
#       expect(address.line2).to              eql   @fishery_details.address.line2
#       expect(address.region).to             eql   @fishery_details.address.region
#       expect(address.country).to            eql   @fishery_details.address.country
#     end

#     it 'creates a fishery and says a nice thing' do
#       expect(page).to have_content "#{@fishery_details.name} was successfully create. Would you like to add a water?"
#     end
#   end

#   # context "form is filled out incorrectly" do

#   #   before do
#   #       visit new_admin_fishery_path
#   #       click_on 'Submit'
#   #   end

#   #   it "shows a helpful validation messages for required fields" do
#   #     expect(page.find('.alert')).to have_content "1 error prohibited this fishery from being saved: Fishery name can't be blank"
#   #   end

#   # end
# end
