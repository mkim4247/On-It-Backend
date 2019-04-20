class Team < ApplicationRecord
  validates :name, presence: true

  has_many :user_teams
  has_many :users, through: :user_teams
  
  has_many :team_boards
  has_many :team_projects, through: :team_boards

end
