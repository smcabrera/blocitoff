class WelcomeController < ApplicationController
  def index
    @user = current_user if user_signed_in?
    @todos = @user.todos.all if @user
  end
end
