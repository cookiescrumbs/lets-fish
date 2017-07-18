class HomepageController < ApplicationController
  include Lets

  def index
    @waters = Lets::Waters::recently_added 6
    @water = Lets::Waters::random
    # fresh_when @waters, public: true
    @fisheries = Lets::Fisheries::recently_added
    # fresh_when @fisheries, public: true
  end
end


