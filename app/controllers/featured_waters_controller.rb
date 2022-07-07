require 'lets'
class FeaturedWatersController < ApplicationController  
    def index
      @waters = Lets::Waters::featured_all
    end
end
  