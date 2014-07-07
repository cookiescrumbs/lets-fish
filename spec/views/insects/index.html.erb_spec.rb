require 'rails_helper'

RSpec.describe "insects/index", :type => :view do
  before(:each) do
    assign(:insects, [
      Insect.create!(),
      Insect.create!()
    ])
  end

  it "renders a list of insects" do
    render
  end
end
