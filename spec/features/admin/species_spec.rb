require_relative '../features_helper'

describe 'Species', type: :feature do
  before(:each) do
    stub_google_geocode_address
    @fishery_manager = FactoryGirl.create :user, email: 'fishery_manager@fishery.com', password: '5lbBr0wnTr0ut'
    login @fishery_manager
  end

  describe 'Manage species' do
    it 'lists all species' do
      FactoryGirl.create(:species, name: 'rainbow trout')
      visit admin_species_index_path
      expect(page).to have_content 'rainbow trout'
    end

    it 'create a species and show the results' do
      visit admin_species_index_path
      fill_in 'species_name', with: 'rainbow trout'
      click_on 'Submit'
      expect(page).to have_content 'rainbow trout'
    end

    it 'delete a species' do
      FactoryGirl.create(:species, name: 'rainbow trout')
      visit admin_species_index_path
      click_on 'Destroy'
      expect(page).not_to have_content 'rainbow trout '
    end

    it 'show a species details' do
      FactoryGirl.create(:species, name: 'rainbow trout')
      FactoryGirl.create(:species, name: 'brown trout')
      visit admin_species_index_path
      page.all('a', text: 'Show')[0].click
      expect(page).to have_content 'rainbow trout'
      expect(page).not_to have_content 'brown trout'
    end
  end
end
