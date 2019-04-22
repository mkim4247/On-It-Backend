class Api::V1::TeamTodosController < ApplicationController
  before_action :find_team_todo, only: [:update, :destroy]

  def create
    @team_todo = TeamTodo.create(team_todo_params)
    if @team_todo.valid?
      render json: { team_todo: TeamTodoSerializer.new(@team_todo)}, status: :accepted
    else
      render json: { errors: @team_todo.errors.full_messages }
    end
  end

  def update
    @team_todo.update(team_todo_params)
    if @team_todo.save
      render json: @team_todo, status: :accepted
    else
      render json: { errors: @team_todo.errors.full_messages }
    end
  end

  def destroy
    @team_todo.destroy
    render json: TeamTodo.all
  end

  private

  def find_team_todo
    @team_todo = TeamTodo.find(params[:id])
  end

  def team_todo_params
    params.require(:team_todo).permit(:name, :description, :team_project_id)
  end
end
