class FitmentNotesController < ApplicationController
  before_action :set_fitment_note, only: [:show, :edit, :update, :destroy]

  # GET /fitment_notes
  # GET /fitment_notes.json
  def index
    @fitment_notes = FitmentNote.all
  end

  # GET /fitment_notes/1
  # GET /fitment_notes/1.json
  def show
  end

  # GET /fitment_notes/new
  def new
    @fitment_note = FitmentNote.new
  end

  # GET /fitment_notes/1/edit
  def edit
  end

  # POST /fitment_notes
  # POST /fitment_notes.json
  def create
    @fitment_note = FitmentNote.new(fitment_note_params)

    respond_to do |format|
      if @fitment_note.save
        format.html { redirect_to @fitment_note, notice: 'Fitment note was successfully created.' }
        format.json { render :show, status: :created, location: @fitment_note }
      else
        format.html { render :new }
        format.json { render json: @fitment_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fitment_notes/1
  # PATCH/PUT /fitment_notes/1.json
  def update
    respond_to do |format|
      if @fitment_note.update(fitment_note_params)
        format.html { redirect_to @fitment_note, notice: 'Fitment note was successfully updated.' }
        format.json { render :show, status: :ok, location: @fitment_note }
      else
        format.html { render :edit }
        format.json { render json: @fitment_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fitment_notes/1
  # DELETE /fitment_notes/1.json
  def destroy
    @fitment_note.destroy
    respond_to do |format|
      format.html { redirect_to fitment_notes_url, notice: 'Fitment note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fitment_note
      @fitment_note = FitmentNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fitment_note_params
      params.require(:fitment_note).permit(:name, :parent_id, :used_for_search)
    end
end
