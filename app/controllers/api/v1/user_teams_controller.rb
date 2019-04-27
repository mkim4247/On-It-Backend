class Api::V1::UserTeamsController < ApplicationController
  before_action :find_user_team, only: [:destroy]

  def index
    @user_teams = UserTeam.all
    render @user_teams
  end

  def create
    @user_team = UserTeam.create(user_team_params)
    if @user_team.valid?
      @user = User.find(params[:user_id])
      @team = Team.find(params[:team_id])
      render json: {
        user_team: @user_team,
        user: UserSerializer.new(@user),
        team: @team
        }, status: :accepted
    else
      render json: { errors: @user_team.errors.full_messages}
    end
  end

  def destroy
    @user_team.destroy
    render json: UserTeam.all
  end

  private

  def find_user_team
    @user_team = UserTeam.find(params[:id])
  end

  def user_team_params
    params.require(:user_team).permit(:user_id, :team_id)
  end

end
