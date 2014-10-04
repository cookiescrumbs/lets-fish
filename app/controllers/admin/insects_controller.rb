class Admin::InsectsController < ApplicationController
  before_action :set_insect, only: [:show, :edit, :update, :destroy]
  layout "admin"
  # GET /insects
  # GET /insects.json
  def index
    @insects = Insect.all
    new
  end

  # GET /insects/1
  # GET /insects/1.json
  def show
  end

  # GET /insects/new
  def new
    @insect = Insect.new
  end

  # GET /insects/1/edit
  def edit
  end

  # POST /insects
  # POST /insects.json
  def create
    @insect = Insect.new(insect_params)

    respond_to do |format|
      if @insect.save
        format.html { redirect_to admin_insects_path @insect, notice: 'Insect was successfully created.' }
        format.json { render action: 'show', status: :created, location: @insect }
      else
        format.html { render action: 'new' }
        format.json { render json: @insect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insects/1
  # PATCH/PUT /insects/1.json
  def update
    respond_to do |format|
      if @insect.update(insect_params)
        format.html { redirect_to admin_insects_path @insect, notice: 'Insect was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @insect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insects/1
  # DELETE /insects/1.json
  def destroy
    @insect.destroy
    respond_to do |format|
      format.html { redirect_to admin_insects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insect
      @insect = Insect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def insect_params
      params.require(:insect).permit(:name, :fishery_ids => [])
    end
end
