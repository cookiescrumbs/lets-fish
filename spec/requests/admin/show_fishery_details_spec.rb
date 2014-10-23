describe "Show fishery details page", :type => :request do

    before(:each) do
      @fishery = FactoryGirl.create(:fishery)
      visit admin_fishery_path @fishery.id
    end

    it "has a name" do
      expect(page).to have_content @fishery.name
    end

    it "has details of the location" do
      expect(page).to have_content @fishery.location["Address"]
    end

    it "has a google map" do
      #pending
    end

    it "has contact details" do
      expect(page).to have_content @fishery.contact_details['Contact name']
      expect(page).to have_content @fishery.contact_details['Telephone']
      expect(page).to have_content @fishery.contact_details['Mobile']
      expect(page).to have_content @fishery.contact_details['Email']
      expect(page).to have_content @fishery.contact_details['Website']
    end

end