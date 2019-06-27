class FeaturedWatersController < ApplicationController
    include Lets
  
    def index
      @waters = Lets::Waters::featured(6)
    end
  end
  