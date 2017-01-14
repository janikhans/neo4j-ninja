class VehicleYearsController < ApplicationController
  before_action :set_vehicle_year, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_years
  # GET /vehicle_years.json
  def index
    @vehicle_years = VehicleYear.all
  end

  # GET /vehicle_years/1
  # GET /vehicle_years/1.json
  def show
  end

  # GET /vehicle_years/new
  def new
    @vehicle_year = VehicleYear.new
  end

  # GET /vehicle_years/1/edit
  def edit
  end

  # POST /vehicle_years
  # POST /vehicle_years.json
  def create
    @vehicle_year = VehicleYear.new(vehicle_year_params)

    respond_to do |format|
      if @vehicle_year.save
        format.html { redirect_to @vehicle_year, notice: 'Vehicle year was successfully created.' }
        format.json { render :show, status: :created, location: @vehicle_year }
      else
        format.html { render :new }
        format.json { render json: @vehicle_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_years/1
  # PATCH/PUT /vehicle_years/1.json
  def update
    respond_to do |format|
      if @vehicle_year.update(vehicle_year_params)
        format.html { redirect_to @vehicle_year, notice: 'Vehicle year was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehicle_year }
      else
        format.html { render :edit }
        format.json { render json: @vehicle_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_years/1
  # DELETE /vehicle_years/1.json
  def destroy
    @vehicle_year.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_years_url, notice: 'Vehicle year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_year
      @vehicle_year = VehicleYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_year_params
      params.require(:vehicle_year).permit(:year)
    end
end
