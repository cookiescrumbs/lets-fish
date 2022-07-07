require 'lets'

class HomepageController < ApplicationController
  def index
    @waters = Lets::Waters::recently_added 6
    @water = Lets::Waters::random
    @waters_with_articles = Water.with_articles 6
    # fresh_when @waters, public: true
    @fisheries = Fishery.recently_added 6
    # fresh_when @fisheries, public: true
    @featured_waters = Lets::Waters::featured 6
  
    @trips = Lets::Trips::private false, 6
  end
end


