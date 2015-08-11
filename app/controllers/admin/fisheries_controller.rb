class Admin::FisheriesController < AdminController

  before_filter :authorize
  before_action :set_fishery, only: [:show, :edit, :update, :destroy]

  def index
    @fisheries         = Fishery.all
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
    @fishery = Fishery.new(fishery_params)
    if @fishery.save
      redirect_to redirect_path, notice: "#{@fishery.name} was successfully create. Would you like to add a water?"
    else
      render action: 'new'
    end
  end

  def update
    if @fishery.update(fishery_params)
      redirect_to admin_fisheries_path, notice: 'Fishery was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @fishery.destroy
    redirect_to admin_fisheries_path
  end

  private

    def redirect_path
      request.env["ORIGINAL_FULLPATH"] == "/list/fishery" ? '/#list-a-fishery' : admin_fisheries_path
    end

    def set_fishery
      @fishery = Fishery.find(params[:id])
    end

    def fishery_params
       params.require(:fishery).permit(:name, contact_details_attributes: [ :name, :telephone, :mobile, :email, :website], address_attributes: [ :postcode, :street, :line2, :region, :country ])
    end
end
