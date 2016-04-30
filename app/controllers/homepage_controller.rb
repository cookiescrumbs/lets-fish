class HomepageController < ApplicationController

  def index
    @waters = Water.order('id desc').limit(3)
    fresh_when @waters

    @fisheries =  Fishery.order('id desc').limit(3)
    fresh_when @fishery
  end

end


