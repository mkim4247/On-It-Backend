class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_many :team_boards
  has_many :team_projects
end
