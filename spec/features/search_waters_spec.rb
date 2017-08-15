require_relative 'features_helper'

describe 'Search', type: :feature do
  describe 'for fishery with waters' do

  fishery = FactoryGirl.create :fishery_with_waters, published: true

  	it 'GET /search/waters with slug' do
    	params = {
	  		slug: @fishery[:slug]
   		}
		get '/search/waters', params: params, headers: {'Accept' => 'application/json'}

		expect(response).to be_success
		expect(json['markers'].length).to eq 5
	end
  end
end
