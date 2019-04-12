class Api::V1::NotesController < ApplicationController
  before_action :find_notes, except: [:create]

  def index
    @notes = Note.all
    render json: { note: NoteSerializer.new(@notes) }
  end

  def create
    @note = Note.create(notes_params)
    if @note.valid?
      render json: { note: NoteSerializer.new(@note) }, status: :accepted
    else
      render json: { errors: @note.errors.full_messages } , status: :not_acceptable
    end
  end

  def update
    @note.update
    if @note.valid?
      render json: { note: NoteSerializer.new(@note) }, status: :accepted
    else
      render json: { errors: @note.errors.full_messages } , status: :not_acceptable
    end
  end

  def destroy
    @note.delete
  end

  private

  def find_notes
    @note = Note.find(params[:id])
  end

  def notes_params
    params.require(:notes).permit(:user_id, :project_id, :type_name, :comment)
  end
end
