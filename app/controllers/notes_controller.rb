class NotesController < ApplicationController
  before_action :set_note, only: %i[ show update destroy ]

  # GET /notes
  def index
    notes = Note.all

    render json: notes
  end

  # GET /notes/1
  def show
    render json: note
  end

  # POST /notes
  def create
  
    note = Note.create!(bucket_list_id:params[:bucket_list_id],title: params[:title],content:params[:content])

    if note
      render json: note, status: :created, location: note
    else
      render json: note.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notes/1
  def update
    if @note.update(note_params)
      render json: @note
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notes/1
  def destroy
    @note.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.permit(:title, :content)
    end
    # require(:note).
end
