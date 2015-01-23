class HomepageController < ApplicationController

  def index
    create_fishery
  end

  def list_fishery
    @fishery = Fishery.new(fishery_params)
    if @fishery.save
      redirect_to "/add/water/#{@fishery.id}#list-a-fishery", notice: "#{@fishery.name} was successfully create. Please now add a water to your fishery."
    else
      render action: "index"
    end
  end

  def add_water
    set_fishery
    render "index"
  end

  private

  def create_fishery
    @fishery                 = Fishery.new
    @fishery.contact_details = ContactDetails.new
    @fishery.address         = Address.new
  end

  def set_fishery
    @fishery = Fishery.find(params[:id])
  end

  def fishery_params
    params.require(:fishery).permit(:name, contact_details_attributes: [ :name, :telephone, :mobile, :email, :website], address_attributes: [ :postcode, :street, :line2, :region, :country ])
  end

end


