class Api::V1::TeamCommentsController < ApplicationController
  before_action :find_team_comment, only: [:destroy]

  def create
    @team_comment = TeamComment.create(team_comment_params)
    if @team_comment.valid?
      render json: { team_comment: TeamCommentSerializer.new(@team_comment)}, status: :accepted
    else
      render json: { errors: @team_comment.errors.full_messages }
    end
  end

  def destroy
    @team_comment.destroy
    render json: TeamComment.all
  end

  private

  def find_team_comment
    @team_comment = TeamComment.find(params[:id])
  end

  def team_comment_params
    params.require(:team_comment).permit(:content, :user_id, :team_project_id)
  end
end
