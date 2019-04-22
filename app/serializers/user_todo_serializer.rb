class UserTodoSerializer < ActiveModel::Serializer
  attributes :title, :description, :due_date
end
