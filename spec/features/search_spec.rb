require_relative 'features_helper'

describe "Search", type: :feature do

  before do
    @search = PageObjects::Search.new
    @search.load
  end

  it "has a page route" do
    expect(@search.status_code).to eql 200
  end

  it "has a map" do
    expect(@search).to have_map
  end

end
