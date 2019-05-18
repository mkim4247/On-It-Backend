class Api::V1::TeamTodosController < ApplicationController
  before_action :find_team_todo, only: [:update, :destroy]

  def create
    @team_todo = TeamTodo.create(team_todo_params)

    # needed for drag and drop reordering
    team_project = TeamProject.find(params[:team_project_id])
    @team_todo.display_order = team_project.team_todos.length

    if @team_todo.save
      render json: { team_todo: TeamTodoSerializer.new(@team_todo) }, status: :accepted
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
    params.require(:team_todo).permit(:display_order, :title, :description, :due_date, :team_project_id)
  end
end
