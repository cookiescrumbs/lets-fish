require 'rails_helper'

RSpec.describe "species/index", :type => :view do
  before(:each) do
    assign(:species, [
      Species.create!(
        :name => ""
      ),
      Species.create!(
        :name => ""
      )
    ])
  end

  it "renders a list of species" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
