class UserCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :user, :user_project
end
