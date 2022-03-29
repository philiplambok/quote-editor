class NotesController < ApplicationController
  def index
    @notes = Note.all.order(created_at: :desc)
  end

  def create
    Note.create(params.require(:note).permit(:text))
    redirect_to root_path
  end
end
