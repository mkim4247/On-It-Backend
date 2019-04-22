class TeamTodoSerializer < ActiveModel::Serializer
  attributes :title, :description, :due_date
end
