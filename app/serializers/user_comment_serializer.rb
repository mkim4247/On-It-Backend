class UserCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :project

  def project
    object.user_project
  end

end
