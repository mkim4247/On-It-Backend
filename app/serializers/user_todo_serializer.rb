class UserTodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :due_date, :user_project_id
end
