class FeaturedWatersController < ApplicationController
    include Lets
  
    def index
      @waters = Lets::Waters::Featured(6)
    end
  end
  