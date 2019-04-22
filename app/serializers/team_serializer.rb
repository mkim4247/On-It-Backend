class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :team_boards, :users

  def team_boards
    object.team_boards.map do |team_board|
      TeamBoardSerializer.new(team_board)
    end
  end

  def users
    object.users.map do |user|
      {first_name: user.first_name,
        last_name: user.last_name,
        username: user.username}
    end
  end

end
