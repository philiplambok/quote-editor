class DateNotesController < ApplicationController
  def new
    note = Note.find_by(id: params[:note_id])
    @date = note.date_notes.build
  end

  def create
    note = Note.find_by(id: params[:note_id])
    note.date_notes.create(params.require(:date_note).permit(:date))
    redirect_to note_path(note), notice: 'Date was successfully added'
  end
end