class FeaturedWatersController < ApplicationController
    include Lets
  
    def index
      @waters = Lets::Waters::featured_all
    end
end
  