class TeamProjectSerializer < ActiveModel::Serializer
  attributes :name, :description, :todos

  def todos
    object.team_todos.map do |team_todo|
      TeamTodoSerializer.new(team_todo)
    end 
  end

end
