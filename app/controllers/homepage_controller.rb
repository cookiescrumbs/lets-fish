class HomepageController < ApplicationController
  before_action :set_fishery, only: [:new_water, :create_water]
  before_action :new_fishery, only: [:index]
  before_action :set_form_partial, only: [:index, :new_water, :create_fishery, :create_water]

  def index
  end

  def create_fishery
    @fishery = Fishery.new(fishery_params)
    if @fishery.save
      redirect_to "/add/water/#{@fishery.id}#list-a-fishery", notice: "#{@fishery.name} was successfully create. Please add a water to the fishery."
    else
      render action: "index"
    end
  end

  def new_water
    @water = @fishery.waters.build
    render action: "index"
  end

  def create_water
    @water = @fishery.waters.build(water_params)
    if @fishery.save
     redirect_to  "/add/water/#{@fishery.id}#list-a-fishery", notice: "#{@water.name} was successfully added to #{@fishery.name}. Add another water to #{@fishery.name}."
    else
      render action: "index"
    end
  end

  private

  def new_fishery
    @fishery                 = Fishery.new
    @fishery.contact_details = ContactDetails.new
    @fishery.address         = Address.new
  end

  def set_form_partial
    @form_partial = (!@fishery.nil? && @fishery.id)? "add_a_water" : "list_a_fishery"
  end

  def set_fishery
    @fishery = Fishery.find(params[:id])
  end

  def fishery_params
    params.require(:fishery).permit(:name, contact_details_attributes: [ :name, :telephone, :mobile, :email, :website], address_attributes: [ :postcode, :street, :line2, :region, :country ])
  end

  def water_params
    params.require(:water).permit(:name, :latitude, :longitude, :water_type_id, :species_ids => [])
  end

end


