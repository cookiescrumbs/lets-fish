class Admin::WaterTypesController < AdminController
  before_action :authorize
  before_action :set_water_type, only: [:show, :edit, :update, :destroy]

  # GET /admin/water_types
  # GET /admin/water_types.json
  def index
    @water_types = WaterType.all
    new
  end

  # GET /admin/water_types/1
  # GET /admin/water_types/1.json
  def show
  end

  # GET /admin/water_types/new
  def new
    @water_type = WaterType.new
  end

  # GET /admin/water_types/1/edit
  def edit
  end

  # POST /admin/water_types
  # POST /admin/water_types.json
  def create
    @water_type = WaterType.new(water_type_params)

    respond_to do |format|
      if @water_type.save
        format.html { redirect_to admin_water_types_path, notice: 'Water type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @water_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @water_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/water_types/1
  # PATCH/PUT /admin/water_types/1.json
  def update
    respond_to do |format|
      if @water_type.update(water_type_params)
        format.html { redirect_to admin_water_types_path, notice: 'Water type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @water_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/water_types/1
  # DELETE /admin/water_types/1.json
  def destroy
    @water_type.destroy
    respond_to do |format|
      format.html { redirect_to admin_water_types_url }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_water_type
    @water_type = WaterType.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def water_type_params
    params.require(:water_type).permit(:category)
  end
end
