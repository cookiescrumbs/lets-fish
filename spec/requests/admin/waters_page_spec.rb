describe "Manage waters page", :type => :request do

   before { FactoryGirl.create(:water, name: "Loch Doooooon") }

  it "Lists waters" do
    visit admin_waters_path
    expect(page).to have_content "Loch Doooooon"
  end

end
