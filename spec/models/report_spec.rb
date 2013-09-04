require 'spec_helper'

describe Report do
  
  before(:each) do
    @report = Report.new
  end

  it "is not valid without a fishery" do
    @report.fishery = nil
    @report.should_not be_valid
  end

end
