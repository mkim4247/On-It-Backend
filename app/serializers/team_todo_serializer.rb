class TeamTodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :due_date, :users, :team_project_id

end
