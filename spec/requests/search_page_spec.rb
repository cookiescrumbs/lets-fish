require_relative 'requests_helper'

describe "Search page", type: :request do

  it "has a page route" do
    visit '/search'
    expect(page.status_code).to eql 200
  end
  
end