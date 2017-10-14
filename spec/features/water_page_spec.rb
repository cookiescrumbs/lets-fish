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
    end

    let(:water) { @fishery.waters.last }

    context 'meta tags are set' do
      it 'has the correct title' do
        visit fishery_water_path @fishery, @fishery.waters.last

        expect(page.title).to eql "Fly fishing at #{water.name.strip}, #{water.short_address}"
      end

      it 'has the correct description' do
        visit fishery_water_path @fishery, @fishery.waters.last

        page_meta_description = page.find('meta[name="description"]', visible: false)['content']
        meta_description_assertion = "Fly fishing at #{water.name}, #{water.short_address}. #{water.description}"[0...130]
        expect(page_meta_description).to include(meta_description_assertion)
      end

      it 'has the correct twitter card tags' do
        visit fishery_water_path @fishery, @fishery.waters.last

        expect(page).to have_css 'meta[name="twitter:card"]', visible:  false
        expect(page).to have_css 'meta[name="twitter:site"]', visible:  false
        expect(page).to have_css 'meta[name="twitter:creator"]', visible: false
        expect(page).to have_css 'meta[name="twitter:title"]', visible:  false
        expect(page).to have_css 'meta[name="twitter:description"]', visible: false
      end
    end

    describe 'permission & tickets' do
      context 'water has permission & ticket information' do
        it 'has details of where to get permission or a ticket' do
          water.permission_tickets = 'You can get a ticket at the Old Cock and Balls pub.'
          water.save
          visit fishery_water_path @fishery, @fishery.waters.last

          expect(page).to have_content 'You can get a ticket at the Old Cock and Balls pub.'
        end
      end

      context 'water has no permission & ticket details but fishery does' do
        it 'has details of where to get permission & ticket from the fishery' do
          water.permission_tickets = nil
          water.save
          @fishery.permission_tickets = 'You can get a ticket from the estate office to fish all lochs.'
          @fishery.save
          visit fishery_water_path @fishery, @fishery.waters.last

          expect(page).to have_content 'You can get a ticket from the estate office to fish all lochs.'
        end
      end

      context 'no permission or tickets on ether water or fishery' do
        it 'has no permission & tickets' do
          water.permission_tickets = nil
          water.save
          @fishery.permission_tickets = nil
          @fishery.save

          visit fishery_water_path @fishery, @fishery.waters.last

          expect(page).to_not have_content 'Permission & Tickets'
        end
      end

    end
  end
end
