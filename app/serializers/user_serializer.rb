class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :user_boards, :teams, :invitations, :sent_invites

  def user_boards
    object.user_boards.map do |user_board|
      UserBoardSerializer.new(user_board)
    end
  end

  def teams
    object.teams.map do |team|
      TeamSerializer.new(team)
    end
  end

end
