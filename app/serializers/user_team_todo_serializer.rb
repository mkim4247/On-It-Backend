class UserTeamTodoSerializer < ActiveModel::Serializer
  attributes :id, :user, :team_todo_id
end
