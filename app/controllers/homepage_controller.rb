class HomepageController < ApplicationController

  def index
    create_fishery
  end

  def list_fishery
    @fishery = CreateFishery.new(params)
    if @fishery.create?
      redirect_to "/add/water/#{@fishery.model.id}", notice: '#{@fishery.model.name} was successfully create. Would you like to add a water?"'
    end
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

end


