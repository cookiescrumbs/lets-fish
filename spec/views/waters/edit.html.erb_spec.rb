require 'spec_helper'

describe "waters/edit" do
  before(:each) do
    @water = assign(:water, stub_model(Water))
  end

  it "renders the edit water form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", water_path(@water), "post" do
    end
  end
end
