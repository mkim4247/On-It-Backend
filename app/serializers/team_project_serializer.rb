class TeamProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :todos, :team_comments, :team_board_id, :updated_at

  def todos
    object.team_todos.map do |team_todo|
      TeamTodoSerializer.new(team_todo)
    end
  end

end
