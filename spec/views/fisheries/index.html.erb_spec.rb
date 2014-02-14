require 'spec_helper'

describe "fisheries/index" do
  before(:each) do
    assign(:fisheries, [
      stub_model(Fishery),
      stub_model(Fishery)
    ])
  end

  it "renders a list of fisheries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
