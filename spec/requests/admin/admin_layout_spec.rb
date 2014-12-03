describe "Admin layout", type: feature do

  before do
    visit '/admin/fisheries'
  end

  it "has a page heading" do
    expect(page).to have_css '.navbar-brand', 'Gone Fishing Admin'
  end

end