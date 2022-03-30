class NotesController < ApplicationController
  def index
    @notes = Note.all.order(created_at: :desc)
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(params.require(:note).permit(:text))
    if @note.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream
      end
      return true
    end

    render :new, status: :unprocessable_entity
  end

  def show
    @note = Note.find params[:id]
  end

  def edit
    @note = Note.find params[:id]
  end

  def update
    @note = Note.find params[:id]
    return redirect_to root_path if @note.update(params.require(:note).permit(:text))

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @note = Note.find params[:id]
    @note.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  end
end
