class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :boards, :teams, :invitations, :sent_invites

  def boards
    object.user_boards.map do |user_board|
      UserBoardSerializer.new(user_board)
    end
  end

  def teams
    object.teams.map do |team|
      TeamSerializer.new(team)
    end
  end

  def invitations
    object.invitations.map do |invitation|
      InviteSerializer.new(invitation)
    end
  end

  def sent_invites
    object.sent_invites.map do |sent_invite|
      InviteSerializer.new(sent_invite)
    end
  end

end
