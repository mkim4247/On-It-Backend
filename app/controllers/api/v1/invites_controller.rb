class Api::V1::InvitesController < ApplicationController
  before_action :find_invite, only: [:destroy]

  def index
    @invites = Invite.all
    render @invites
  end

  def create
    @invite = Invite.find_or_create_by(invite_params)
    if @invite.valid?
      render json: {
        invite: InviteSerializer.new(@invite),
        message: "created",
        error: false
      }, status: :created
    else
      render json: { error: "failed to create invite" }, status: :not_acceptable
    end
  end

  def destroy
    @invite.destroy
    render json: Invite.all
  end

  private

  def find_invite
    @invite = Invite.find(params[:id])
  end

  def invite_params
    params.require(:invite).permit(:email, :team_id, :sender_id, :receiver_id)
  end


end
