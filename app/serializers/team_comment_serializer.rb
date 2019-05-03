class TeamCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :team_project_id, :created_at

  def created_at
    object.created_at.strftime("%b %d at %I:%M%p")
  end
end
