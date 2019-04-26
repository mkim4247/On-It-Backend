class TeamTodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :due_date, :team_project_id
end
