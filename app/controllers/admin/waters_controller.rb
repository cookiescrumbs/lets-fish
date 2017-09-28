class Admin::WatersController < AdminController

  before_action :authenticate_user!

  before_action :set_fishery, only: [:index, :new, :update, :create, :edit]
  before_action :set_water, only: [:edit, :update]
  before_action :set_image, only: [:edit, :update]

  def index
    flash.now[:notice] = 'There are no waters associated with this fishery. Please add a water.' if @fishery.waters.empty?
  end

  def new
    @water = @fishery.waters.build
    @image = @water.images.build
  end

  def create
    build_water_with_images
    respond_to do |format|
      if @fishery.save
        format.html { redirect_to your_fishery_path, notice: "#{@water.name} was successfully added to #{@fishery.name}" }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if update_water(@water) && update_image(@water) && update_image_geograph_photo_id(@water)
        format.html { redirect_to your_fishery_path, notice: "#{@water.name} was successfully updated." }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def edit
  end

  def destroy
    @fishery = Fishery.friendly.find(params[:fishery_id])
    @water = Water.friendly.find(params[:id])
    @water.destroy
    respond_to do |format|
      format.html { redirect_to your_fishery_path, notice: "#{@water.name} was successfully deleted" }
    end
  end

  private

  def build_water_with_images
    @water = @fishery.waters.build(water_params)

    if image_params[:images]
      image_params[:images].each do | image |
        build_image(@water, image)
      end
    end
    # add_geograph_photo_id_to(image) unless image.nil?
  end

  def build_image(water, image)
    water.images.build image: image unless image.nil?
  end

  def add_geograph_photo_id_to(image)
    image.geograph_photo_id = geograph_photo_id_param['geograph_photo_id'] unless geograph_photo_id_param.nil?
  end

  def update_image_geograph_photo_id(water)
    return true if geograph_photo_id_param.nil? || water.images.length === 0
    image = water.images.first
    image.update geograph_photo_id: geograph_photo_id_param['geograph_photo_id']
  end

  def update_image(water)
    return true if image_params.nil?
    if !water.images.empty?
      water.images.first.update image: image_params[:image]
    else
      build_image(water)
      water.save
    end
  end

  def update_water(water)
    water.update water_params
  end

  def set_fishery
    @fishery = Fishery.find_by(slug: params[:fishery_id])
  end

  def set_water
    @water = Water.find_by(slug: params[:id])
  end

  def set_image
    @image = Water.find_by(slug: params[:id]).images.first
  end

  def water_params
    params.require(:water).permit(:name, :address, :description, :published, :latitude, :longitude, :annotation, :water_type_id, species_ids: [])
  end

  def image_params
    params.require(:files).permit(images: []) unless params[:files][:images].nil?
  end

  def geograph_photo_id_param
    params.require(:image).permit(:geograph_photo_id) unless params[:image][:geograph_photo_id].nil?
  end
end
