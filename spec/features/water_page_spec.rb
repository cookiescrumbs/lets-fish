require_relative 'features_helper'

describe 'Water page', type: :feature do
  describe 'Some random fishery with waters' do
    before(:each) do
      stub_geograph_photo_details
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      stub_dark_sky
      stub_instagram_media_by_tags
      @species    = FactoryGirl.create_list :species, 5
      @water_type = FactoryGirl.create_list :water_type, 5
      @fishery    = FactoryGirl.create :fishery_with_waters

      visit fishery_water_path @fishery, @fishery.waters.last
    end

    let(:water) { @fishery.waters.last }

    context 'meta tags are set' do
      it 'has the correct title' do
        expect(page.title).to eql "Fly fishing at #{water.name.strip}, #{water.short_address}"
      end

      it 'has the correct description' do
        page_meta_description = page.find('meta[name="description"]', visible: false)['content']
        meta_description_assertion = "Fly fishing at #{water.name}, #{water.short_address}. #{water.description}"[0...130]
        expect(page_meta_description).to include(meta_description_assertion)
      end

      it 'has the correct twitter card tags' do
        expect(page).to have_css 'meta[name="twitter:card"]', visible:  false
        expect(page).to have_css 'meta[name="twitter:site"]', visible:  false
        expect(page).to have_css 'meta[name="twitter:creator"]', visible: false
        expect(page).to have_css 'meta[name="twitter:title"]', visible:  false
        expect(page).to have_css 'meta[name="twitter:description"]', visible: false
      end
    end
  end
end
