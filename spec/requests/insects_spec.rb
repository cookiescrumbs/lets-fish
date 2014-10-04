require 'rails_helper'

describe "Insects", :type => :request do
  describe "Manage insects" do
      it "Lists all insects" do
        FactoryGirl.create(:insect, name: "Big fat bug")
        visit admin_insects_path
        expect(page).to have_content "Big fat bug"
      end

      it "Create an insect and show the results" do
        visit admin_insects_path
        fill_in 'insect_name', :with => "Big massive hairy bug"
        click_on 'Create Insect'
        expect(page).to have_content "Big massive hairy bug"
      end

      it "Delete an insect" do
        FactoryGirl.create(:insect, name: "Big fat bug")
        visit admin_insects_path
        click_on 'Destroy'
        expect(page).not_to have_content "Big fat bug"
      end

      it "Show an insects details" do
        FactoryGirl.create(:insect, name: "Big fat bug")
        FactoryGirl.create(:insect, name: "Massive hairy bug")
        visit admin_insects_path
        page.all("a",text: "Show")[1].click
        expect(page).to have_content "Massive hairy bug"
        expect(page).not_to have_content "Big fat bug"
      end
  end
end

