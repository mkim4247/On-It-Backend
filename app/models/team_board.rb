class TeamBoard < ApplicationRecord
  validates :name, presence: true

  belongs_to :team
  has_many :team_projects
  has_many :team_todos, through: :team_projects
  
end
