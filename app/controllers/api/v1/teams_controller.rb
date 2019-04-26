class Api::V1::TeamsController < ApplicationController
  before_action :find_team, only: [:update, :show, :destroy]

  def index
    @teams = Team.all
    render json: @teams
  end

  def create
    @team = Team.create(team_params)
    if @team.valid?
      UserTeam.create(team_id: @team.id, user_id: params[:user_id])
      render json: {
        team: TeamSerializer.new(@team),
        message: "created",
        error: false,
      }, status: :created
    else
      render json: { error: 'failed to create team' }, status: :not_acceptable
    end
  end

  def show
    render json: @team
  end

  def update
    @team.update(team_params)
    if @team.save
      render json: @team, status: :accepted
    else
      render json: { errors: @team.errors.full_messages }
    end
  end

  def destroy
    @team.destroy
    render json: Team.all
  end

  private

  def find_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :description, :user_id)
  end

end
