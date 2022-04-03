class DateNotesController < ApplicationController
  def new
    note = Note.find_by(id: params[:id])
    @date = note.date_notes.build
  end

  def create
    note = Note.find_by(id: params[:id])
    note.date_notes.create(params.require(:date_note).permit(:date))
    redirect_to note_path, notice: 'Date was successfully added'
  end
end