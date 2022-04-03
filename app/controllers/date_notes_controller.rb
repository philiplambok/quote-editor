class DateNotesController < ApplicationController
  def new
    note = Note.find_by(id: params[:note_id])
    @date = note.date_notes.build
  end

  def edit
    @date = DateNote.find_by(id: params[:id])
  end

  def update
    @date = DateNote.find_by(id: params[:id])
    @date.update(params.require(:date_note).permit(:date))
    redirect_to note_path(@date.note), notice: 'Date was successfully updated'
  end

  def destroy
    @date = DateNote.find_by(id: params[:id])
    @date.destroy
    redirect_to note_path(@date.note), notice: 'Date was deleted updated'
  end

  def create
    note = Note.find_by(id: params[:note_id])
    @date_note = note.date_notes.build(params.require(:date_note).permit(:date)) 
    if @date_note.save
      return respond_to do |format|
        format.html { redirect_to note_path(note), notice: 'Date was successfully added' }
        format.turbo_stream
      end
      return 
    end

    render :new, status: :unprocessable_entity
  end
end