  class Admin::FisheriesController < ApplicationController
  before_action :set_fishery, only: [:show, :edit, :update, :destroy]

  def index
    @fisheries = Fishery.all
    flash.now[:notice] = 'There are no fisheries. Please add a fishery.' if @fisheries.empty?
  end

  def show
  end

  def new
    @fishery = Fishery.new
  end

  def edit
  end

  def create
    @fishery = Fishery.new(fishery_params)

    respond_to do |format|
      if @fishery.save
        format.html { redirect_to admin_fisheries_path, notice: "#{@fishery.name} was successfully create. Would you like to add a water?"}
        format.json { render action: 'show', status: :created, location: @fishery }
      else
        format.html { render action: 'new' }
        format.json { render json: @fishery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fishery.update(fishery_params)
        format.html { redirect_to admin_fisheries_path, notice: 'Fishery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fishery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fishery.destroy
    respond_to do |format|
      format.html { redirect_to admin_fisheries_path }
      format.json { head :no_content }
    end
  end

  private

    def set_fishery
      @fishery = Fishery.find(params[:id])
    end

    def fishery_params
       params.require(:fishery).permit(:name, :contact_name, :street, :line2, :region, :country, :postcode, :telephone, :mobile, :email, :website)
    end
end
