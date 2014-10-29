describe "New water page", type: :request do
  
  before :each do
   @fishery = FactoryGirl.create :fishery
  end

  it "Add a water to a fishery" do
    visit new_admin_fishery_water_path @fishery.id

    fill_in 'water_name', with: "Total Loch Doon"
    fill_in 'water_latitude', with: -90
    fill_in 'water_longitude', with: -180

    click_on "Submit"

    expect(page).to have_content "Total Loch Doon"
  end
  

end