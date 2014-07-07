require 'rails_helper'

RSpec.describe "Insects", :type => :request do
  describe "GET /insects" do
    it "works! (now write some real specs)" do
      get insects_path
      expect(response.status).to be(200)
    end
  end
end
