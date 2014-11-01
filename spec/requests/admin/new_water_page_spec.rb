describe "New water page", type: :request do
  
  before :each do
    @fishery = FactoryGirl.create :fishery, name: "Bob's big fishery"
    visit new_admin_fishery_water_path @fishery.id
  end

  it "has the name of the fishery" do
    expect(page).to have_content "New water for Bob's big fishery"
  end 

  context "form is filled out correctly" do

    it "Add a water to a fishery" do
      fill_in 'water_name', with: "Total Loch Doon"
      fill_in 'water_latitude', with: -90
      fill_in 'water_longitude', with: -180

      click_on "Submit"

      expect(page).to have_content "Total Loch Doon"
    end

  end

  context "form is filled out incorrectly" do

    it "has a validation messages for required fields" do
      fill_in 'water_name',       with: ''
      fill_in 'water_latitude',   with: ''
      fill_in 'water_longitude',  with: ''
      
      click_on "Submit"

      expect(page.find('.alert')).to have_content "3 errors prohibited this water from being saved: Name can't be blank Latitude is not a number Longitude is not a number"
    end




  end
end