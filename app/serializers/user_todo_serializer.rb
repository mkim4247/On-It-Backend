class UserTodoSerializer < ActiveModel::Serializer
  attributes :id, :display_order, :title, :description, :due_date, :user_project_id
end
