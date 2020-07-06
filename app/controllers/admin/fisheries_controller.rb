class Admin::FisheriesController < AdminController
  before_action :authenticate_user!
  before_action :set_fishery, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.auth === Rails.application.config.admin
      @fisheries = Fishery.order name: :asc
    else
      @fisheries = current_user.fisheries.order name: :asc
    end

    flash.now[:notice] = 'There are no fisheries. Please add a fishery.' if @fisheries.empty?
  end

  def show
  end

  def new
    @fishery                 = Fishery.new
    @fishery.contact_details = ContactDetails.new
    @fishery.address         = Address.new
  end

  def edit
  end

  def create
    if current_user.auth === Rails.application.config.admin
      @fishery = Fishery.new(fishery_params)
    else
      @fishery = current_user.fisheries.new(fishery_params)
    end

    if @fishery.save
      redirect_to admin_fisheries_path, notice: "#{@fishery.name} was successfully create. Would you like to add a water?"
    else
      render action: 'new'
    end
  end

  def update
    if @fishery.update(fishery_params)
      redirect_to your_fishery_path, notice: 'Fishery was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @fishery.destroy
    redirect_to admin_fisheries_path
  end

  private

  def set_fishery
    if current_user.auth === Rails.application.config.admin
      @fishery = Fishery.friendly.find(params[:id])
    else
      @fishery = current_user.fisheries.friendly.find(params[:id])
    end
  end

  def fishery_params
    params.require(:fishery).permit(
        :name, 
        :slug,
        :description, 
        :permission_tickets, 
        :published, 
        :map_zoom_level,
        contact_details_attributes: [:id, :name, :telephone, :mobile, :email, :website], 
        address_attributes: [:id, :postcode, :street, :line2, :region, :country]
    )
  end
end
