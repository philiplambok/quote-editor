class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def create
    Note.create(params.require(:note).permit(:text))
    redirect_to root_path
  end
end
