require_relative 'features_helper'

describe 'Water page', type: :feature, focus: true do

  describe 'Some random fishery with waters' do

    before(:each) do
      stub_geograph_photo_details
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      @species    = FactoryGirl.create_list :species, 5
      @water_type = FactoryGirl.create_list :water_type, 5
      @fishery    = FactoryGirl.create :fishery_with_waters

      visit "/waters/#{@fishery.waters.last.slug}"
    end

    let(:water){ @fishery.waters.last }

    context 'meta tags are set' do

      it 'has the correct title' do
        expect(page.title).to eql "Fly fishing at #{water.name.strip}, #{water.short_address}"
      end

      it 'has the correct description' do
        page_meta_description = page.find('meta[name="description"]', visible: false)["content"]
        meta_description_assertion = "Fly fishing at #{water.name}, #{water.short_address}. #{water.description}"[0...160]
        expect(page_meta_description).to eql meta_description_assertion
      end

    end

  end

end
