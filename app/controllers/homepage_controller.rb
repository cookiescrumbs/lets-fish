class HomepageController < ApplicationController
  
  def index
     @fisheries = Fishery.all
  end

end
