class TeamBoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :projects, :team_id, :updated_at

  def projects
    object.team_projects.map do |team_project|
      TeamProjectSerializer.new(team_project)
    end
  end

end
