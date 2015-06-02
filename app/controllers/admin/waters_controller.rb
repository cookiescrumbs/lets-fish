class Admin::WatersController < AdminController
  before_action :set_fishery, only: [ :index, :new, :update, :create, :edit]
  before_action :set_water, only: [:edit, :update]

  skip_before_action :verify_authenticity_token

  def index
    flash.now[:notice] = 'There are no waters associated with this fishery. Please add a water.' if @fishery.waters.empty?
  end

  def new
    @water = @fishery.waters.build
  end

  def create
    @water = @fishery.waters.build(water_params)
    respond_to do |format|
      if @fishery.save
        format.html { redirect_to admin_fishery_waters_path(@fishery), notice: "#{@water.name} was successfully added to #{@fishery.name}" }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def within_bounding_box
    @waters = Water.within_bounding_box(bounds).limit(max_number_of_waters)
    respond_to do |format|
      format.json { @waters }
    end
  end

  def update
    respond_to do |format|
      if @water.update water_params
        format.html { redirect_to admin_fishery_waters_path(@fishery), notice: "#{@water.name} was successfully updated."}
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def edit
  end

  def destroy
    @fishery = Fishery.find(params[:fishery_id])
    @water = Water.find(params[:id])
    @water.destroy
    respond_to do | format |
      format.html { redirect_to admin_fishery_waters_path(@fishery), notice: "#{@water.name} was successfully deleted" }
    end
  end

  private

  def set_fishery
    @fishery = Fishery.find(params[:fishery_id])
  end

  def set_water
    @water = Water.find(params['id'])
  end

  def water_params
    params.require(:water).permit(:name, :latitude, :longitude, :water_type_id, :species_ids => [])
  end

  def bounds
    params[:bounds]
  end

  def max_number_of_waters
    params[:max_number_of_waters]
  end

end
