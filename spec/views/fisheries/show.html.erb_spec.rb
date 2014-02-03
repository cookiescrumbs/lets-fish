require 'spec_helper'

describe "fisheries/show" do
  before(:each) do
    @fishery = assign(:fishery, stub_model(Fishery))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
