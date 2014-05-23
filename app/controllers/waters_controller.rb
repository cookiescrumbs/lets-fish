class WatersController < ApplicationController
  before_action :set_water, only: [:show, :edit, :update, :destroy]

  # GET /waters
  # GET /waters.json
  def index
    @waters = Water.all
  end

  # GET /waters/1
  # GET /waters/1.json
  def show
  end

  # GET /waters/new
  def new
    @water = Water.new
  end

  # GET /waters/1/edit
  def edit
  end

  # POST /waters
  # POST /waters.json
  def create
    @water = Water.new(water_params)

    respond_to do |format|
      if @water.save
        format.html { redirect_to @water, notice: 'Water was successfully created.' }
        format.json { render action: 'show', status: :created, location: @water }
      else
        format.html { render action: 'new' }
        format.json { render json: @water.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waters/1
  # PATCH/PUT /waters/1.json
  def update
    respond_to do |format|
      if @water.update(water_params)
        format.html { redirect_to @water, notice: 'Water was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @water.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waters/1
  # DELETE /waters/1.json
  def destroy
    @water.destroy
    respond_to do |format|
      format.html { redirect_to waters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water
      @water = Water.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def water_params
      params.require(:water).permit(:name, :lng, :lat)
    end
end
