require_relative 'features_helper'

describe "Search page", type: :feature do

  it "has a page route" do
    visit '/search'
    expect(page.status_code).to eql 200
  end

end
