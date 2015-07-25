class HomepageController < ApplicationController
  before_action :set_fishery, only: [:new_water, :create_water]
  before_action :new_fishery, only: [:index]
  # before_action :set_form_partial, only: [:index, :new_water, :create_fishery, :create_water]

  def index
  end

  def create_fishery
    @fishery = Fishery.new(fishery_params)
    if @fishery.save
      notice = "#{@fishery.name} was successfully create. Please add a water to #{@fishery.name}" unless @fishery.name.empty?
      redirect_to "/add/water/#{@fishery.id}#add-a-water", notice: notice
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
     redirect_to  "/add/water/#{@fishery.id}#add-a-water", notice: water_notice(@fishery, @water)
    else
      render action: "index"
    end
  end

  private

  def water_notice(fishery, water)
    if fishery.name.empty?
      return "#{water.name} was successfully added. You can add another water, if you like."
    end
    "#{water.name} was successfully added to #{fishery.name}. You can add another water to #{fishery.name}, if you like."
  end

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


