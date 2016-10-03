require_relative '../features_helper'

describe 'Your fishery page', type: :feature, focus: true do

  context 'Fishery Manager has a fishery to manage' do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      @fishery_manager = FactoryGirl.create :user, email: 'fishery_manager@fishery.com', password: '5lbBr0wnTr0ut',  auth: Rails.application.config.fishery_manager

      sign_in @fishery_manager

      visit your_fishery_path
    end

    let(:fishery) { @fishery_manager.fisheries.last}
    let(:last_water) { fishery.waters.last }
    let(:edit_button) { page.all('.edit-fishery').first }

    it 'updates a fishery\'s details' do

      edit_button.click

      expect(page.find_field('fishery-name').value).to eql fishery.name

      fill_in 'fishery-name', with: "Dave's Big Trout Fishery"

      click_on 'Submit'

      expect(page).to have_content "Dave's Big Trout Fishery"
    end

    it 'has the fishery name' do
      expect(page).to have_content fishery.name
    end

    it 'has a list of waters' do
      expect(page.all('div.water').length).to eql fishery.waters.length
    end

    it 'has a button to add a water to a fishery' do
      expect(page).to have_link 'Add a water', href: new_admin_fishery_water_path(fishery)
    end

    it 'has a button to edit a water' do
       expect(page.all('div.water').first).to have_link 'Edit details', href: edit_admin_fishery_water_path(fishery, last_water)
    end
  end

  context 'Administrator has fisheries to manage' do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      @admin = FactoryGirl.create :user, email: 'admin@lets.fish', password: '25lbBr0wnTr0ut',  auth: Rails.application.config.admin

      sign_in @admin

      visit your_fishery_path
    end

    let(:fishery) { @fishery_manager.fisheries.last}
    let(:last_water) { fishery.waters.last }
    let(:edit_button) { page.all('.edit-fishery').first }

    describe 'administrator privilages' do

      it 'has a button to add a new fishery' do
        expect(page).to have_link 'Add a new fishery', href: new_admin_fishery_path
      end

      # it 'deletes a fishery'do
      #   expect { click_on 'destroy' }.to change(Fishery, :count).from(1).to(0)
      # end

      # it 'deletes associated waters' do
      #   expect { click_on 'destroy' }.to change(Water, :count).from(5).to(0)
      # end

    end

  end


end
