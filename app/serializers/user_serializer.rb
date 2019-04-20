class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email
  has_many :user_boards
  has_many :user_projects
  has_many :teams
end
