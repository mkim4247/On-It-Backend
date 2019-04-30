class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :boards, :users

  def boards
    object.team_boards.map do |team_board|
      TeamBoardSerializer.new(team_board)
    end
  end

  def users
    object.users.map do |user|
      {
        id: user.id,
        first_name: user.first_name,
        last_name: user.last_name,
        username: user.username,
        email: user.email
      }
    end
  end

end
