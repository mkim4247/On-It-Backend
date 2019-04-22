class TeamBoardSerializer < ActiveModel::Serializer
  attributes :name, :description, :projects

  def projects
    object.team_projects.map do |team_project|
      TeamProjectSerializer.new(team_project)
    end
  end

end
