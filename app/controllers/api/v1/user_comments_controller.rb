class Api::V1::UserCommentsController < ApplicationController
  before_action :find_user_comment, only: [:destroy]

  def create
    @user_comment = UserComment.create(user_comment_params)
    if @user_comment.valid?
      render json: @user_comment, status: :accepted
    else
      render json: { errors: @user_comment.errors.full_messages }
    end
  end

  def destroy
    @user_comment.destroy
    @comments = UserComment.all.select do |user_comment|
      user_comment.user_project_id == params[:user_project_id]
    end
    render json: @comments
  end

  private

  def find_user_comment
    @user_comment = UserComment.find(params[:id])
  end

  def user_comment_params
    params.require(:user_comment).permit(:content, :user_id, :user_project_id)
  end

end
