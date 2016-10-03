require_relative '../../features_helper'

describe 'Edit your user account', type: :feature do
  describe 'user has an account' do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address

      @fishery_manager = FactoryGirl.create :user, email: 'fishery_manager@fishery.com', password: '5lbBr0wnTr0ut', auth: Rails.application.config.fishery_manager
      sign_in @fishery_manager
      visit edit_user_registration_path
    end

    describe 'User changes their password', focus: true do

      context 'successfully fills in the change password form' do
        it 'shows a helpful validation messages for required fields' do
          fill_in 'Email', with: 'changed@gmail.com'
          fill_in 'New Password', with: 'newpassword'
          fill_in 'Confirm New Password', with: 'newpassword'
          fill_in 'Current Password', with: '5lbBr0wnTr0ut'

          click_on 'Update details'

          expect(page).to have_content 'Invalid email or password.'
        end
      end

      context 'incorrectly fills in the change password form' do
        before(:each) do
          fill_in 'Email', with: @fishery_manager.email
          fill_in 'Password', with: @fishery_manager.password
          click_on 'Log in'
        end

        it 'redirected to the users fishery page' do
          expect(page.current_url).to end_with your_fishery_path
        end

        it 'can see that they are logged in' do
          expect(page).to have_content "Signed in as #{@fishery_manager.email}"
        end

        it 'can logout in the header' do
          page.click_link('Logout')
          expect(page.current_url).to end_with '/'
        end
      end
    end
  end
end
