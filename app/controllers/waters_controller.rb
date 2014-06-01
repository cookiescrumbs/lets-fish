class WatersController < ApplicationController
  #before_action :set_water, only: [:show, :edit, :update, :destroy]

  def create
    @fishery = Fishery.find(params[:fishery_id])
    @water = @fishery.waters.build(water_params)

    if @water.save
      redirect_to fishery_path(@fishery)
    else
      render 'fisheries/show'
    end
  end

  # def destroy
  #   @fishery = Fishery.find(params[:fishery_id])
  #   @water = @fishery.waters.find(params[:id])
  #   @water.destroy

  #   notice = "Water #{@water.name} was successfully deleted."
  #   notice = "Water #{@water.name} could not be deleted." unless @water.destroyed? 
    
  #   redirect_to fishery_path(@fishery), notice: notice
  # end

  private
    # def set_water
    #   @water = Water.find(params[:id])
    # end
    def water_params
      params.require(:water).permit(:name, :lng, :lat)
    end
end
