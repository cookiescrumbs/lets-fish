require 'rails_helper'

RSpec.describe "Species", :type => :request do
  describe "GET /species" do
    it "works! (now write some real specs)" do
      get species_index_path
      expect(response.status).to be(200)
    end
  end
end
