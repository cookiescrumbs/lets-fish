require 'rails_helper'

RSpec.describe "insects/edit", :type => :view do
  before(:each) do
    @insect = assign(:insect, Insect.create!())
  end

  it "renders the edit insect form" do
    render

    assert_select "form[action=?][method=?]", insect_path(@insect), "post" do
    end
  end
end
