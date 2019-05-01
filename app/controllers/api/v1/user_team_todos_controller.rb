class Api::V1::UserTeamTodosController < ApplicationController

  def create
    @user_team_todo = UserTeamTodo.create(user_team_todo_params)
    if @user_team_todo.valid?
      render json: @user_team_todo, status: :accepted
    else
      render json: { errors: @user_team_todo.errors.full_messages }
    end
  end

  def destroy
    @user_team_todo = UserTeamTodo.find_by(user_id: params[:user_id], team_todo_id: params[:team_todo_id])
    @user_team_todo.destroy

    @user = User.find(params[:user_id])
    render json: @user

  end

  private

  def user_team_todo_params
    params.require(:user_team_todo).permit(:user_id, :team_todo_id)
  end

end
