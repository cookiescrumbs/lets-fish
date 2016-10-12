require_relative '../features_helper'

describe 'Water Type', type: :feature do
  before(:each) do
    stub_google_geocode_lat_lng
    stub_google_geocode_address
    @fishery_manager = FactoryGirl.create :user, email: 'fishery_manager@fishery.com', password: '5lbBr0wnTr0ut', auth: Rails.application.config.fishery_manager

    sign_in @fishery_manager
  end
  describe 'Manage water types' do
    it 'lists all water types' do
      FactoryGirl.create(:water_type, category: 'loch')
      visit admin_water_types_path
      expect(page).to have_content 'Loch'
    end

    it 'create a water type and show the results' do
      visit admin_water_types_path
      fill_in 'water_type_category', with: 'reservoir'
      click_on 'Submit'
      expect(page).to have_content 'Reservoir'
    end

    it 'delete a water type' do
      FactoryGirl.create(:water_type, category: 'river')
      visit admin_water_types_path
      delete_water_type = page.all('a', text: 'Destroy')[0]
      expect { delete_water_type.click }.to change(WaterType, :count).from(3).to(2)
    end

    it 'show a water type detail' do
      @water_types = FactoryGirl.create_list :water_type, 2
      visit admin_water_types_path
      page.all('a', text: 'Show')[0].click
      expect(page).to have_content @water_types.first.category
    end
  end
end
