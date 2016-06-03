require_relative '../features_helper'

describe 'Water Type', type: :feature do
  before(:each) do
    login FactoryGirl.create :user
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
      click_on 'Destroy'
      expect(page).not_to have_content 'River'
    end

    it 'show a water type detail' do
      @water_types = FactoryGirl.create_list :water_type, 2
      visit admin_water_types_path
      page.all('a', text: 'Show')[0].click
      expect(page).to have_content @water_types.first.category
    end
  end
end
