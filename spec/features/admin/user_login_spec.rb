require_relative '../features_helper'

describe 'User log in', type: :feature do
  describe 'user has an account' do
    before(:each) do
      @fishery_manager = FactoryGirl.create :user, email: 'fishery_manager@fishery.com', password: '5lbBr0wnTr0ut'
      visit your_fishery_path
    end

    context 'tries to log in with incorrect details' do
      it 'shows a helpful validation messages for required fields', focus: true do
        fill_in 'Email', with: 'wrongemail@wrong.com'
        fill_in 'Password', with: 'wrongpassword'
        click_on 'Log In'
        expect(page.find('.alert')).to have_content 'Invalid email or password.'
      end
    end

    context 'logs in using the correct details' do
      before(:each) do
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_on 'Submit'
      end

      it 'redirected to the fisheries page' do
        expect(page.current_url).to end_with '/admin/fisheries'
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
