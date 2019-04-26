class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:update, :show, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: {
        user: UserSerializer.new(@user),
        message: "created",
        error: false,
        token: encode({user_id: @user.id})
        }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

  def show
    render json: @user
  end

  def update
    @user.update(user_params)
    if @user.save
      render json: @user, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def destroy
    @user.destroy
    render json: User.all
  end

  def profile
    token = request.headers["Authentication"].split(" ")[1]
    payload = decode(token)
    user_id = payload["user_id"]
    @user = User.find(user_id)
    render json: @user, status: :accepted
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end

end
