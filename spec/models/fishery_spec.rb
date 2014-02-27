require 'spec_helper'

describe Fishery do
  
  before(:each) do
    @fishery = Fishery.new
  end

  it "is not valid without a name, street, city and region" do
    @fishery.name = nil
    @fishery.street = nil
    @fishery.city = nil
    @fishery.region = nil
    @fishery.should_not be_valid
  end
end