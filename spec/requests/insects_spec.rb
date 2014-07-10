require 'rails_helper'

describe "Insects", :type => :request do
  describe "Manage insects" do
      it "lists all insects" do
        FactoryGirl.create(:insect, name: "Big fat bug")
        visit insects_path
        expect(page).to have_content "Big fat bug"
      end

      it "Create an insect and show the results" do
        visit insects_path
        fill_in 'insect_name', :with => "Big massive hairy bug"
        click_on 'Create Insect'
        expect(page).to have_content "Big massive hairy bug"
      end
  end
end

