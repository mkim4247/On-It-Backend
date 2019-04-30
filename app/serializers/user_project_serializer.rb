class UserProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :todos, :comments, :user_board_id, :updated_at

  def todos
    object.user_todos.map do |user_todo|
      UserTodoSerializer.new(user_todo)
    end
  end

  def comments
    object.user_comments
  end

end
