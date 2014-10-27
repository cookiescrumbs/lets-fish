class Admin::WatersController < ApplicationController

  def index
    @fishery = Fishery.find(params[:fishery_id])
    flash.now[:notice] = 'There are no waters associated with this fishery. Please add a water.' if @fishery.waters.empty?
  end

end
