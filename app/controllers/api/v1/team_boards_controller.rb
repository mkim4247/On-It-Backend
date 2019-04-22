class Api::V1::TeamBoardsController < ApplicationController
  before_action :find_team_board, only: [:update, :destroy]

  def create
    @team_board = TeamBoard.create(team_board_params)
    if @team_board.valid?
      render json: { team_board: TeamBoardSerializer.new(@team_board)}, status: :accepted
    else
      render json: { errors: @team_board.errors.full_messages }
    end
  end

  def update
    @team_board.update(team_board_params)
    if @team_board.save
      render json: @team_board, status: :accepted
    else
      render json: { errors: @team_board.errors.full_messages }
    end
  end

  def destroy
    @team_board.destroy
    render json: TeamBoard.all
  end

  private

  def find_team_board
    @team_board = TeamBoard.find(params[:id])
  end

  def team_board_params
    params.require(:team_board).permit(:name, :description, :team_id)
  end

end
