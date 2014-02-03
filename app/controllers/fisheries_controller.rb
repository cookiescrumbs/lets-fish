class FisheriesController < ApplicationController
  before_action :set_fishery, only: [:show, :edit, :update, :destroy]

  # GET /fisheries
  # GET /fisheries.json
  def index
    @fisheries = Fishery.all
  end

  # GET /fisheries/1
  # GET /fisheries/1.json
  def show
  end

  # GET /fisheries/new
  def new
    @fishery = Fishery.new
  end

  # GET /fisheries/1/edit
  def edit
  end

  # POST /fisheries
  # POST /fisheries.json
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

  # PATCH/PUT /fisheries/1
  # PATCH/PUT /fisheries/1.json
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

  # DELETE /fisheries/1
  # DELETE /fisheries/1.json
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
      params[:fishery]
    end
end
