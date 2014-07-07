require 'rails_helper'

RSpec.describe "insects/show", :type => :view do
  before(:each) do
    @insect = assign(:insect, Insect.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
