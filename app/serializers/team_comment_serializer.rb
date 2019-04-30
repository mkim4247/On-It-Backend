class TeamCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :project

  def project
    object.team_project
  end

end
