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
        it 'shows successful message confirming the changes has been made' do   

          fill_in 'Email', with: 'changed@gmail.com'
          fill_in 'New Password', with: 'newpassword'
          fill_in 'Confirm New Password', with: 'newpassword'
          fill_in 'Current Password', with: @fishery_manager.password
          click_on 'Update details'
      
          expect(page).to have_content 'Your account has been updated successfully.'
          expect(page.current_url).to end_with edit_user_registration_path
        end 
      end

      context 'incorrectly fills in the change password form' do

        it 'has an error message' do

          fill_in 'Email', with: 'blah@blah.com'
          fill_in 'New Password', with: 'sdssdsdd'
          fill_in 'Confirm New Password', with: 'sdsdssdsdsdd'

          click_on 'Update'
          expect(page).to have_content 'Something went wrong!'
        end
      end
    end
  end
end
