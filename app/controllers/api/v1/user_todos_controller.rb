class Api::V1::UserTodosController < ApplicationController
  before_action :find_user_todo, only: [:update, :destroy]

  def create
    @user_todo = UserTodo.create(user_todo_params)

    # needed for drag and drop reordering 
    user_project = UserProject.find(params[:user_project_id])
    @user_todo.display_order = user_project.user_todos.length

    if @user_todo.save
      render json: { user_todo: UserTodoSerializer.new(@user_todo)}, status: :accepted
    else
      render json: { errors: @user_todo.errors.full_messages }
    end
  end

  def update
    @user_todo.update(user_todo_params)
    if @user_todo.save
      render json: @user_todo, status: :accepted
    else
      render json: { errors: @user_todo.errors.full_messages }
    end
  end

  def destroy
    @user_todo.destroy
    render json: UserTodo.all
  end

  private

  def find_user_todo
    @user_todo = UserTodo.find(params[:id])
  end

  def user_todo_params
    params.require(:user_todo).permit(:display_order, :title, :description, :due_date, :user_project_id)
  end

end
