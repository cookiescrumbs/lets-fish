require_relative '../features_helper'

describe 'Manage waters page', type: :feature do

  context 'there is a fishery with waters' do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address

      @fishery_manager = FactoryGirl.create :user, email: 'fishery_manager@fishery.com', password: '5lbBr0wnTr0ut',  auth: Rails.application.config.fishery_manager

      sign_in @fishery_manager

      visit your_fishery_path
    end

    let(:fishery) { @fishery_manager.fisheries.last}
    let(:water) { @fishery_manager.fisheries.first.waters.last }
    let(:checked_species_name) { @fishery_manager.fisheries.first.waters.last.species.last.name.capitalize}
    let(:first_species_name) { Species.first.name.capitalize }
    let(:edit_button) { page.all('.edit-water').first }
    let(:number_of_waters) { @fishery_manager.fisheries.last.waters.count }

    it 'lists a fisheries waters' do
      expect(page.all('div.waters div.water').count).to eql number_of_waters
    end

    it 'has a link to create a new water' do
      expect(page).to have_link 'Add a water', href: new_admin_fishery_water_path(fishery)
    end

    it 'has the name of the fishery on the page' do
      expect(page).to have_content "#{fishery.name}"
    end

    it 'can delete a water with a nice message' do
      name = water.name
      first_water = page.all('.destroy').first
      expect { first_water.click }.to change(fishery.waters, :count).from(5).to(4)
      expect(page.find('.alert')).to have_content "#{name} was successfully deleted"
    end

    describe 'a water can be edited' do
      it 'has the waters name as a title' do
        edit_button.click
        expect(page.find('h3').text).to eql "Editing #{water.name}"
      end

      it 'has the correct fields in the edit form' do
        edit_button.click
        expect(page.find_field('water_name').value).to eql water.name
        expect(page.find('#latitude').value.to_f).to eql water.latitude
        expect(page.find('#longitude').value.to_f).to eql water.longitude
        expect(page.has_checked_field?(checked_species_name)).to be true
        expect(page.find('img.water')[:src]).to include 'loch.jpg'
        expect(page.find('#image_geograph_photo_id').value.to_i).to eql water.images.last.geograph_photo_id
      end

      it 'updates a waters details and returns a nice message' do
        edit_button.click
        fill_in 'water_name', with: 'loch dooooooon'
        # had to use find as the fields are hidden
        find('#latitude').set(-90)
        find('#longitude').set(-180)
        find('#water_address').set 'Somewhere, Wales'
        check first_species_name
        attach_file('file', File.join(Rails.root, 'spec/fixtures/files/another-loch.jpg'))
        find('#image_geograph_photo_id').set 987_654
        click_on 'Submit'

        expect(page).to have_content 'loch dooooooon'
        expect(page).to have_content 'Somewhere, Wales'
        expect(water.species.length).to eql 2
        expect("#{water.species.first.name} #{water.species.last.name}").to eql "#{first_species_name.downcase} #{checked_species_name.downcase}"
        expect(page.find('.alert')).to have_content 'loch dooooooon was successfully updated.'
        expect(water.images.last.image_file_name).to eql 'another-loch.jpg'
        expect(water.images.last.geograph_photo_id).to eql 987_654
        expect(water.address).to eql 'Somewhere, Wales'
      end

      it 'shows a helpful validation messages for required fields' do
        edit_button.click
        fill_in 'water_name', with: ''
        click_on 'Submit'

        expect(page.find('.alert')).to have_content "1 error prohibited this water from being saved: Water name can't be blank"
      end
    end
  end

  context 'there is a fishery without waters' do
    before(:each) do
      stub_google_geocode_lat_lng
      stub_google_geocode_address

      @fishery_manager = FactoryGirl.create :user, email: 'fishery_manager@fishery.com', password: '5lbBr0wnTr0ut',  auth: Rails.application.config.fishery_manager
      @fishery_manager.fisheries.first.waters = []

      sign_in @fishery_manager

      visit your_fishery_path
    end

    it 'has a lovely message telling you to create a water' do
      expect(page).to have_content 'There are no waters associated with this fishery. Add a water'
    end
  end
end
