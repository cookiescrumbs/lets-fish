require 'spec_helper'

describe "waters/index" do
  before(:each) do
    assign(:waters, [
      stub_model(Water),
      stub_model(Water)
    ])
  end

  it "renders a list of waters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
