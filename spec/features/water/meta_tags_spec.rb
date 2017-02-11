require_relative '../features_helper'

describe 'Water page meta tags', type: :feature, focus: true do
    before(:each) do
      stub_geograph_photo_details
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      stub_dark_sky
      stub_instagram_media_by_tags
      @species    = FactoryGirl.create_list :species, 5
      @water_type = FactoryGirl.create_list :water_type, 5
      @fishery    = FactoryGirl.create :fishery_with_waters

      visit "/waters/#{@fishery.waters.last.slug}"
    end

    it 'has the twitter card tags' do
      expect(page).to have_css 'meta[name="twitter:card"]', :visible => false
      expect(page).to have_css 'meta[name="twitter:site"]', :visible => false
      expect(page).to have_css 'meta[name="twitter:creator"]', :visible => false
      expect(page).to have_css 'meta[name="twitter:title"]', :visible => false
      expect(page).to have_css 'meta[name="twitter:description"]', :visible => false
    end
end