class HomepageController < ApplicationController
  include Lets

  def index
    @waters = Lets::Waters::recently_added 6
    @water = Lets::Waters::random
    # fresh_when @waters, public: true
    @fisheries = Lets::Fisheries::recently_added 6
    # fresh_when @fisheries, public: true
    @featured_waters = Lets::Waters::featured 6
  
    @trips = Lets::Trips::private false, 6
  end
end


