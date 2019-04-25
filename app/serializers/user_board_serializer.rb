class UserBoardSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :projects

  def projects
    object.user_projects.map do |user_project|
      UserProjectSerializer.new(user_project)
    end
  end

end
