class UserProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :todos, :user_comments, :user_board_id, :updated_at

  def todos
    object.user_todos.map do |user_todo|
      UserTodoSerializer.new(user_todo)
    end
  end
end
