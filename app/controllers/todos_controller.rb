class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @user = current_user
    @todo = @user.todos.build(todo_params)

    if @todo.save
      redirect_to root_path, notice: "Your new TODO was saved!"
    else
      flash[:notice] = "Sorry, your task couldn't be saved. It needs a description."
      render :new
    end
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.toggle_complete
      redirect_to root_path
    else
      flash[:notice] = "Sorry, there was a problem processing your request. Please try again"
      redirect_to root_path
    end
  end

  def todo_params
    params.require(:todo).permit(:description)
  end
end

