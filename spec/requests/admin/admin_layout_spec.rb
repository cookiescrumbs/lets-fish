require_relative '../requests_helper'

describe "Admin layout", type: feature do

  before do
    visit '/admin/fisheries'
  end

  it "has a page title" do
    expect page.has_title? 'Gone Fishing Admin'
  end

  it "has a page heading" do
    expect(page).to have_css '.navbar-brand', 'Gone Fishing Admin'
  end

  describe "Navigation" do

    let(:nav_bar) { page.find('.navbar') }

    it "has a link to fisheries index" do
      expect(nav_bar.has_link? "Fisheries", href: 'admin/fisheries')
    end

    it "has a sign out link" do
      expect(nav_bar.has_link? "Sign out")
    end
    
  end


end