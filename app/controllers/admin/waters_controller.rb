class Admin::WatersController < AdminController

  before_action :authenticate_user!

  before_action :set_fishery, only: %i[index new update create edit destroy]
  before_action :set_water, only: %i[edit update destroy]

  def index
    flash.now[:notice] = 'There are no waters associated with this fishery. Please add a water.' if @fishery.waters.empty?
  end

  def new
    @water = @fishery.waters.build
    5.times { @water.images.build }
  end

  def edit
    5.times { @water.images.build }
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
      :permission_tickets,
      :published,
      :featured,
      :latitude,
      :longitude,
      :annotation,
      :article_magazine,
      :article_date,
      :article_page,
      :article_author,
      :article_affiliate_link,
      :article_affiliate_mag_image,
      :article_headline,
      :article_subheadline,
      :water_type_id,
      species_ids: [],
      images_attributes: %i[id image hero geograph_photo_id attribution _destroy]
    )
  end

end
