require 'spec_helper'

describe "waters/new" do
  before(:each) do
    assign(:water, stub_model(Water).as_new_record)
  end

  it "renders new water form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", waters_path, "post" do
    end
  end
end
