class PartAttributesController < ApplicationController
  before_action :set_part_attribute, only: [:show, :edit, :update, :destroy]

  # GET /part_attributes
  # GET /part_attributes.json
  def index
    @part_attributes = PartAttribute.all
  end

  # GET /part_attributes/1
  # GET /part_attributes/1.json
  def show
  end

  # GET /part_attributes/new
  def new
    @part_attribute = PartAttribute.new
  end

  # GET /part_attributes/1/edit
  def edit
  end

  # POST /part_attributes
  # POST /part_attributes.json
  def create
    @part_attribute = PartAttribute.new(part_attribute_params)

    respond_to do |format|
      if @part_attribute.save
        format.html { redirect_to @part_attribute, notice: 'Part attribute was successfully created.' }
        format.json { render :show, status: :created, location: @part_attribute }
      else
        format.html { render :new }
        format.json { render json: @part_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /part_attributes/1
  # PATCH/PUT /part_attributes/1.json
  def update
    respond_to do |format|
      if @part_attribute.update(part_attribute_params)
        format.html { redirect_to @part_attribute, notice: 'Part attribute was successfully updated.' }
        format.json { render :show, status: :ok, location: @part_attribute }
      else
        format.html { render :edit }
        format.json { render json: @part_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_attributes/1
  # DELETE /part_attributes/1.json
  def destroy
    @part_attribute.destroy
    respond_to do |format|
      format.html { redirect_to part_attributes_url, notice: 'Part attribute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part_attribute
      @part_attribute = PartAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_attribute_params
      params.require(:part_attribute).permit(:name, :parent_id)
    end
end
