require 'spec_helper'

describe Fish do

  before(:each) do
    @fish = Fish.new
  end

  it "is not valid without a species" do
    @fish.species = nil
    @fish.should_not be_valid
  end

end
