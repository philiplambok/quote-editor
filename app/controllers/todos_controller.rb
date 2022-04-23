class TodosController < ApplicationController
  def new
    @todo = Todo.new(date_note: DateNote.find(params[:date_note_id]))
  end

  def create
    todo_params = params.require(:todo).permit(:name, :date_note_id)
    @todo = Todo.create!(todo_params)
    redirect_to note_path(@todo.date_note.note)
  end
end
