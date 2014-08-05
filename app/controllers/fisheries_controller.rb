  class FisheriesController < ApplicationController
  before_action :set_fishery, only: [:show, :edit, :update, :destroy]
 
  def index
    @fisheries = Fishery.all
  end

  def show
    @fishery = Fishery.find(params[:id])
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
        format.html { redirect_to @fishery, notice: 'Fishery was successfully created.' }
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
        format.html { redirect_to @fishery, notice: 'Fishery was successfully updated.' }
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
      format.html { redirect_to fisheries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fishery
      @fishery = Fishery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fishery_params
       params.require(:fishery).permit(:name, :contact_name, :street, :line2, :region, :country, :postcode, :telephone, :mobile, :email, :website, :lat_lng, :description, :prices, :record, :season, :facilities, :species_ids => [],:insect_ids => [])
    end
end
