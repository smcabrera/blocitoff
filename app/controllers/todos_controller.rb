class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @todo, notice: "Your new TODO was saved!"
    else
      flash[:notice] = "Sorry, your task couldn't be saved. It needs a description."
      render :new
    end
  end

  def todo_params
    params.require(:todo).permit(:description)
  end

  def show
    @todo = Todo.find params[:id]
  end
end
