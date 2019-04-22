class Api::V1::UserProjectsController < ApplicationController
  before_action :find_user_project, only: [:update, :destroy]

  def create
    @user_project = UserProject.create(user_project_params)
    if @user_project.valid?
      render json: { user_project: UserProjectSerializer.new(@user_project)}, status: :accepted
    else
      render json: { errors: @user_project.errors.full_messages }
    end
  end

  def update
    @user_project.update(user_project_params)
    if @user_project.save
      render json: @user_project, status: :accepted
    else
      render json: { errors: @user_project.errors.full_messages }
    end
  end

  def destroy
    @user_project.destroy
    render json: UserProject.all
  end

  private

  def find_user_project
    @user_project = UserProject.find(params[:id])
  end

  def user_project_params
    params.require(:user_project).permit(:name, :description, :user_board_id)
  end

end
