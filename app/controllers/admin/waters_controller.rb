class Admin::WatersController < AdminController

  before_action :authenticate_user!

  before_action :set_fishery, only: [:index, :new, :update, :create, :edit, :destroy]
  before_action :set_water, only: [:edit, :update, :destroy]

  def index
    flash.now[:notice] = 'There are no waters associated with this fishery. Please add a water.' if @fishery.waters.empty?
  end

  def new
    @water = @fishery.waters.build
    3.times { @water.images.build }
  end

  def edit
    3.times { @water.images.build }
  end

  def create
    @water = @fishery.waters.build(water_params)
    if @fishery.save
      redirect_to your_fishery_path, notice: "#{@water.name} was successfully added to #{@fishery.name}"
    else
      render action: 'new'
    end
  end

  def update
    if @water.update water_params
      redirect_to your_fishery_path, notice: "#{@water.name} was successfully updated."
    else
      render action: 'edit'
    end
  end

  def destroy
    @water.destroy
    redirect_to your_fishery_path, notice: "#{@water.name} was successfully deleted"
  end

  private

  def set_fishery
    @fishery = Fishery.find_by(slug: params[:fishery_id])
  end

  def set_water
    @water = Water.find_by(slug: params[:id])
  end

  def water_params
    params.require(:water).permit(
      :name,
      :address,
      :description,
      :published,
      :latitude,
      :longitude,
      :annotation,
      :water_type_id,
      species_ids: [],
      images_attributes: [:id, :image, :hero,  :_destroy]
    )
  end

end
