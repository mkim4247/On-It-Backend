class Api::V1::TeamProjectsController < ApplicationController
  before_action :find_team_project, only: [:update, :destroy]

  def create
    @team_project = TeamProject.create(team_project_params)
    if @team_project.valid?
      render json: { team_project: TeamProjectSerializer.new(@team_project)}, status: :accepted
    else
      render json: { errors: @team_project.errors.full_messages }
    end
  end

  def update
    @team_project.update(team_project_params)
    if @team_project.save
      render json: @team_project, status: :accepted
    else
      render json: { errors: @team_project.errors.full_messages }
    end
  end

  def destroy
    @team_project.destroy
    render json: TeamProject.all
  end

  private

  def find_team_project
    @team_project = TeamProject.find(params[:id])
  end

  def team_project_params
    params.require(:team_project).permit(:name, :description, :team_board_id)
  end

end
