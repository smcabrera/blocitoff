class TodosController < ApplicationController
  def index
    @user = current_user if user_signed_in?
    @todos = @user.todos.all if @user
  end

  def new
    @todo = Todo.new
  end

  def create
    @user = current_user
    @todo = @user.todos.build(todo_params)

    @todo.save
    #respond_to do |format|
    #  format.js { render js: "alert('#{@todo.description}')"}
    #end
    render :create
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.toggle_complete
     render :update #  redirect_to root_path
    else
      flash[:notice] = "Sorry, there was a problem processing your request. Please try again"
      redirect_to root_path
    end
  end

  def todo_params
    params.require(:todo).permit(:description)
  end
end

