class TeamTodoSerializer < ActiveModel::Serializer
  attributes :id, :display_order, :title, :description, :due_date, :users, :team_project_id

end
