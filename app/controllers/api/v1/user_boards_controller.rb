class Api::V1::UserBoardsController < ApplicationController
  before_action :find_user_board, only: [:update, :destroy]

  def create
    @user_board = UserBoard.create(user_board_params)
    if @user_board.valid?
      render json: { user_board: UserBoardSerializer.new(@user_board)}, status: :accepted
    else
      render json: { errors: @user_board.errors.full_messages }
    end
  end

  def update
    @user_board.update(user_board_params)
    if @user_board.save
      render json: @user_board, status: :accepted
    else
      render json: { errors: @user_board.errors.full_messages }
    end
  end

  def destroy
    @user_board.destroy
    render json: UserBoard.all
  end

  private

  def find_user_board
    @user_board = UserBoard.find(params[:id])
  end

  def user_board_params
    params.require(:user_board).permit(:name, :description, :background_image, :user_id)
  end

end
