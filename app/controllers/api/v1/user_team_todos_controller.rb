class Api::V1::UserTeamTodosController < ApplicationController
  before_action :find_user_team_todo, only: [:destroy]

  def create
    @user_team_todo = UserTeamTodo.create(user_team_todo_params)
    if @user_team_todo.valid?
      render json: {:user_team_todo: UserTeamTodoSerializer.new(@user_team_todo)}, status: :accepted
    else
      render json: { errors: @user_team_todo.errors.full_messages }
    end
  end

  def destroy
    @user_team_todo.destroy
    render json: UserTeamTodo.all
  end

  private

  def find_user_team_todo
    @user_team_todo = UserTeamTodo.find(params[:id])
  end

  def user_team_todo_params
    params.require(:user_team_todo).permit(:user_id, :team_todo_id)
  end

end
