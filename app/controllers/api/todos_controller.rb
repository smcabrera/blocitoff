class Api::TodosController < ApiController
  def index
    @user = User.find_by(auth_token: params[:auth_token])
    @todos = @user.todos.all
    render json: @todos
  end

  def create
    @user = User.find_by(auth_token: params[:auth_token])
    render json: "Create new todo"
  end
end

