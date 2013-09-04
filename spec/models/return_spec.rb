require 'spec_helper'

describe Return do

  before(:each) do
    @return = Return.create(name: "Steven Cook", ticket: "day boat")

    @return.fishs.create species:"rainbow trout", weight: 10.5, fly: "zulu", location: "dam wall"
    @return.fishs.create species:"blue trout", weight: 20.5, fly: "butcher", location: "dam wall"
    @return.fishs.create species:"blue trout", weight: 5, fly: "ke-he", location: "dam wall"
    @return.fishs.create species:"brown trout", weight: 7.8, fly: "ke-he", location: "dam wall"

  end

  it "is valid with valid attributes" do
    @return.should be_valid
  end

  it "is not valid without name" do
    @return.name = nil
    @return.should_not be_valid
  end

  it "is not valid without ticket type" do
    @return.ticket = nil
    @return.should_not be_valid
  end


  it "has a total number of fish" do
    @return.total_number.should == 4
  end

  it "has a total weight of fish" do
    @return.total_weight.should == 43.8
  end

  it "has a best fish" do
    @return.best_fish.should == 20.5
  end

  it "has a best of each species" do
    @return.fishs.create species:"brown trout", weight: 15.7, fly: "butcher", location: "dam wall"
    @return.fishs.create species:"brown trout", weight: 12.7, fly: "daddy", location: "dam wall"

    @return.best_species.should == {"rainbow trout" => 10.5, "blue trout" => 20.5, "brown trout" => 15.7}
  end

  it "has a best fly"

end
