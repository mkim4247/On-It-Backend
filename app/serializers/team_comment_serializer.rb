class TeamCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :team_project_id

end
