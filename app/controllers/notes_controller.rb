class NotesController < ApplicationController
  def index
    @notes = current_user.notes.order(created_at: :desc)
  end

  def new
    @note = current_user.notes.build
  end

  def create
    @note = current_user.notes.build(params.require(:note).permit(:text))
    if @note.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream { flash.now[:notice] = 'Quote was successfully created.' }
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
