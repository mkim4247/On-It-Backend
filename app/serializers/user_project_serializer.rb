class UserProjectSerializer < ActiveModel::Serializer
  attributes :name, :description, :todos

  def todos
    object.user_todos.map do |user_todo|
      UserTodoSerializer.new(user_todo)
    end
  end
end
