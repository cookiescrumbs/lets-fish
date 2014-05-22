require 'spec_helper'

describe "waters/show" do
  before(:each) do
    @water = assign(:water, stub_model(Water))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
