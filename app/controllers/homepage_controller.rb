class HomepageController < ApplicationController
  include Homepage

  def index
    @waters = Homepage::Waters::recently_added(6)
    # fresh_when @waters, public: true
    @fisheries = Homepage::Fisheries::recently_added
    # fresh_when @fisheries, public: true
  end
end


