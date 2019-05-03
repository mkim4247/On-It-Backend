class TeamProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :todos, :comments, :team_board_id, :updated_at

  def todos
    object.team_todos.map do |team_todo|
      TeamTodoSerializer.new(team_todo)
    end
  end

  def comments
    object.team_comments.map do |team_comment|
      TeamCommentSerializer.new(team_comment)
    end 
  end

end
