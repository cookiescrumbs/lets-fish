require_relative '../features_helper'

describe "User login", type: :feature, focus: true do

  describe "user has an account" do

    before(:each) do
      @user = FactoryGirl.create :user, password: '5lbBr0wnTr0ut'
      visit admin_login_path
    end

    context "tries to login with incorrect details" do

      it "shows a helpful validation messages for required fields" do
        fill_in 'email', with: 'wrongemail@wrong.com'
        fill_in 'password', with: 'wrongpassword'
        click_on 'Submit'
        expect(page.find('.alert')).to have_content "Email or Password is invalid"
      end

    end

    context "logs in using the correct details" do

      before(:each) do
        fill_in 'email', with: @user.email
        fill_in 'password', with: @user.password
        click_on 'Submit'
      end

      it "redirected to the fisheries page" do
        expect(page.current_url).to end_with '/admin/fisheries'
      end

      it "can see that they are logged in" do
        expect(page.find('.navbar')).to have_content "Signed in as #{@user.email}"
      end

      it "can logout in the header" do
        page.click_link('Logout')
        expect(page.current_url).to end_with '/admin/login'
        expect(page.find('.navbar')).to have_content "Login"
      end

    end

  end
end
