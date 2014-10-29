class Admin::WatersController < ApplicationController
  before_action :set_fishery, only: [ :index, :new, :create]

  def index
    flash.now[:notice] = 'There are no waters associated with this fishery. Please add a water.' if @fishery.waters.empty?
  end

  def new
  end

  def create
    @fishery.waters.create(water_params)

    respond_to do |format|
      if @fishery.save
        format.html { redirect_to admin_fishery_waters_path @fishery, notice: 'Water was successfully created' }
        format.json { render action: 'show', status: :created, location: @fishery }
      end
    end
  end

  private

    def set_fishery
      @fishery = Fishery.find(params[:fishery_id])
    end

    def water_params
       params.require(:water).permit(:name, :latitude, :longitude)
    end
end
