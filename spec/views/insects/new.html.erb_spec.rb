require 'rails_helper'

RSpec.describe "insects/new", :type => :view do
  before(:each) do
    assign(:insect, Insect.new())
  end

  it "renders new insect form" do
    render

    assert_select "form[action=?][method=?]", insects_path, "post" do
    end
  end
end
