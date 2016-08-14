require_relative '../features_helper'

describe 'User log in', type: :feature do
  describe 'user has an account' do
    before(:each) do
      stub_google_geocode_address
      @fishery_manager = FactoryGirl.create :user, email: 'fishery_manager@fishery.com', password: '5lbBr0wnTr0ut'
      visit your_fishery_path
    end

    context 'tries to log in with incorrect details' do
      it 'shows a helpful validation messages for required fields' do
        fill_in 'Email', with: 'wrongemail@wrong.com'
        fill_in 'Password', with: 'wrongpassword'
        click_on 'Log In'
        expect(page.find('.alert')).to have_content 'Invalid email or password.'
      end
    end

    context 'logs in using the correct details' do
      before(:each) do
        fill_in 'Email', with: @fishery_manager.email
        fill_in 'Password', with: @fishery_manager.password
        click_on 'Log In'
      end

      it 'redirected to the users fishery page' do
        expect(page.current_url).to end_with your_fishery_path
      end

      it 'can see that they are logged in' do
        expect(page.find('.navbar')).to have_content "Signed in as #{@user.email}"
      end

      it 'can logout in the header' do
        page.click_link('Logout')
        expect(page.current_url).to end_with '/admin/login'
        expect(page.find('.navbar')).to have_content 'Login'
      end
    end
  end
end
