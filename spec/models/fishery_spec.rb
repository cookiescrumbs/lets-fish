require 'rails_helper'

describe Fishery, :type => :model do
  
  before(:each) do
    @fishery = Fishery.new
  end

  it "is not valid without a name" do
    @fishery.name = nil
    expect(@fishery).not_to be_valid
  end

  describe "#formatted_fields" do
    
    it "returns all fields that are not empty as a hash" do
      fishery = FactoryGirl.create(:fishery, name: "Stevo's Big trout fishery")
      # fishery.id
      # expect(fishery.formatted_fields).to eql ({ "description" => "test"})
    end
  end

  describe "#formatted_address" do
    it "returns a formatted address" do

    end
  end

end