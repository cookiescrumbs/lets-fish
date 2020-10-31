require_relative '../../features_helper'

describe 'Edit your user account', type: :feature do
  describe 'user has an account' do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address

      @fishery_manager = FactoryBot.create :user, email: 'fishery_manager@fishery.com', password: '5lbBr0wnTr0ut', auth: Rails.application.config.fishery_manager
      sign_in @fishery_manager
      visit edit_user_registration_path
    end

    describe 'User changes their password' do

      context 'successfully fills in the change password form' do


        it 'shows a helpful validation messages for required fields' do   

          fill_in 'Email', with: 'changed@gmail.com'
          fill_in 'New Password', with: 'newpassword'
          fill_in 'Confirm New Password', with: 'newpassword'
          fill_in 'Current Password', with: '5lbBr0wnTr0ut'

          click_on 'Update details'
      
          expect(page).to have_content 'Your account has been updated successfully.'
          expect(page.current_url).to end_with edit_user_registration_path
        end 
      end

      context 'incorrectly fills in the change password form' do

        it 'has an error message' do

          fill_in 'Email', with: 'blah@blah.com'
          fill_in 'New Password', with: 'asadsadsad'
          fill_in 'Confirm New Password', with: 'nsadasdsadsadass'
          fill_in 'Current Password', with: 'sadasdasdasdasdsa'

          click_on 'Update details'
          expect(page).to have_content 'Something went wrong!'
        end
      end
    end
  end
end
