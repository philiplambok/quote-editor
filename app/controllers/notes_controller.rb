class NotesController < ApplicationController
  def index
    @notes = Note.all.order(created_at: :desc)
  end

  def create
    Note.create(params.require(:note).permit(:text))
    redirect_to root_path
  end

  def edit
    @note = Note.find params[:id]
  end

  def update
    @note = Note.find params[:id]
    @note.update(params.require(:note).permit(:text))
    redirect_to root_path
  end
end
