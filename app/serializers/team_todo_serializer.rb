class TeamTodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :due_date
end
