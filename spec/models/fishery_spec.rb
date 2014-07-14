require 'rails_helper'

describe Fishery, :type => :model do
  
  before(:each) do
    @fishery = Fishery.new
  end

  it "is not valid without a name" do
    @fishery.name = nil
    expect(@fishery).not_to be_valid
  end

end