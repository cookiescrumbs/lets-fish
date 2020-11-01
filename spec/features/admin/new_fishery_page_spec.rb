require_relative '../features_helper'

describe 'New fishery page', type: :feature do
  before(:each) do
    stub_google_geocode_lat_lng
    stub_google_geocode_address

    @admin = FactoryBot.create :user, email: 'fishery_manager@fishery.com', password: '5lbBr0wnTr0ut', auth: Rails.application.config.admin

    sign_in @admin
    visit your_fishery_path
  end

  let(:fishery_details){ @fishery_details }

  context 'form is filled out correctly' do

    before do
      visit new_admin_fishery_path

      @fishery_details = FactoryBot.build(:fishery)

      fill_in 'fishery-name', with: @fishery_details.name
      fill_in 'fishery-description', with: @fishery_details.description
      fill_in 'fishery-permission-tickets', with: @fishery_details.permission_tickets

      fill_in 'contact-name', with: @fishery_details.contact_details.name
      fill_in 'telephone', with: @fishery_details.contact_details.telephone
      fill_in 'mobile', with: @fishery_details.contact_details.mobile
      fill_in 'email', with: @fishery_details.contact_details.email
      fill_in 'website', with: @fishery_details.contact_details.website

      fill_in 'postcode', with: @fishery_details.address.postcode
      fill_in 'street', with: @fishery_details.address.street
      fill_in 'line2', with: @fishery_details.address.line2
      fill_in 'region', with: @fishery_details.address.region

      select 'Wales', from: 'fishery_address_attributes_country'

      click_on 'Submit fishery details'
    end

    let(:fishery_details){ @fishery_details }

    it 'creates a fishery with contact details and address' do
      fishery = Fishery.find_by name: fishery_details.name

      expect(fishery.name).to eql fishery_details.name
      expect(fishery.description).to eql fishery_details.description
      expect(fishery.permission_tickets).to eql fishery_details.permission_tickets

      expect(fishery.contact_details.name).to eql fishery_details.contact_details.name
      expect(fishery.contact_details.telephone).to eql fishery_details.contact_details.telephone
      expect(fishery.contact_details.mobile).to eql fishery_details.contact_details.mobile
      expect(fishery.contact_details.email).to eql fishery_details.contact_details.email
      expect(fishery.contact_details.website).to eql fishery_details.contact_details.website

      expect(fishery.address.postcode).to eql fishery_details.address.postcode
      expect(fishery.address.street).to eql @fishery_details.address.street
      expect(fishery.address.line2).to eql @fishery_details.address.line2
      expect(fishery.address.region).to eql @fishery_details.address.region
      expect(fishery.address.country).to eql 'Wales'

    end

    it 'creates a fishery and says a nice thing' do
      expect(page).to have_content "#{@fishery_details.name} was successfully create. Would you like to add a water?"
    end
  end

  context 'form is filled out incorrectly' do

    before do
        visit new_admin_fishery_path
        click_on 'Submit fishery details'
    end

    it 'shows a helpful validation messages for required fields' do
      expect(page.find('.alert')).to have_content "2 errors prohibited this fishery from being saved: Fishery name can't be blank Fishery description can't be blank"
    end

  end
end
