require 'spec_helper'

describe "fisheries/edit" do
  before(:each) do
    @fishery = assign(:fishery, stub_model(Fishery))
  end

  it "renders the edit fishery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fishery_path(@fishery), "post" do
    end
  end
end
