describe 'Fishery model', type: :model  do
  let(:total_published_fisheries_with_published_waters) { 5 }
  describe 'scopes' do
    before do
      stub_google_geocode_lat_lng
      stub_google_geocode_address
      create_species
      create_water_types
    end
    describe 'Given there are 
      published fisheries with published waters,
      a published fishery with unpublished waters,
      an unpublished fishery with published waters and 
      a published fishery with no waters' do
        before do
          published_fisheries_with_published_waters total_published_fisheries_with_published_waters
          published_fishery_with_unpublished_water
          unpublished_fishery_with_published_waters 1
          published_fishery_with_no_waters
        end
      describe Fishery, '#recently_add' do
        context 'when called without a count' do
          it 'Then it returns the 3 most recent published fisheries with published waters' do
            expect(Fishery.recently_added.count).to eql 3
          end
        end
        context 'when called with a count of 4' do
          it 'Then it returns the 4 most recent published fisheries with published waters' do
            expect(Fishery.recently_added(4).count).to eql 4
          end
        end
      end
      describe Fishery, '#alpha_all' do
        context 'when called without params' do
          it 'Then it returns all the published fisheries with published waters in alphabetical order' do
            expect(Fishery.all_alpha_order.count).to eql total_published_fisheries_with_published_waters
          end
        end
      end
    end
  end
end

