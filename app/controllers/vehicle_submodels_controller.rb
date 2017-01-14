class VehicleSubmodelsController < ApplicationController
  before_action :set_vehicle_submodel, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_submodels
  # GET /vehicle_submodels.json
  def index
    @vehicle_submodels = VehicleSubmodel.all
  end

  # GET /vehicle_submodels/1
  # GET /vehicle_submodels/1.json
  def show
  end

  # GET /vehicle_submodels/new
  def new
    @vehicle_submodel = VehicleSubmodel.new
  end

  # GET /vehicle_submodels/1/edit
  def edit
  end

  # POST /vehicle_submodels
  # POST /vehicle_submodels.json
  def create
    @vehicle_submodel = VehicleSubmodel.new(vehicle_submodel_params)

    respond_to do |format|
      if @vehicle_submodel.save
        format.html { redirect_to @vehicle_submodel, notice: 'Vehicle submodel was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_submodel }
      else
        format.html { render :new }
        format.json { render json: @vehicle_submodel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_submodels/1
  # PATCH/PUT /vehicle_submodels/1.json
  def update
    respond_to do |format|
      if @vehicle_submodel.update(vehicle_submodel_params)
        format.html { redirect_to @vehicle_submodel, notice: 'Vehicle submodel was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_submodel }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_submodel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_submodels/1
  # DELETE /vehicle_submodels/1.json
  def destroy
    @vehicle_submodel.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_submodels_url, notice: 'Vehicle submodel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_submodel
      @vehicle_submodel = VehicleSubmodel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_submodel_params
      params.require(:vehicle_submodel).permit(:vehicle_model_id, :name)
    end
end
