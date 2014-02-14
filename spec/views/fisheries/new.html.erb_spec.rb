require 'spec_helper'

describe "fisheries/new" do
  before(:each) do
    assign(:fishery, stub_model(Fishery).as_new_record)
  end

  it "renders new fishery form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fisheries_path, "post" do
    end
  end
end
