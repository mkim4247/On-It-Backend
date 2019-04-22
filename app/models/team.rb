class Team < ApplicationRecord
  validates :name, presence: true

  has_many :user_teams, dependent: :destroy
  has_many :users, through: :user_teams

  has_many :team_boards, dependent: :destroy
  has_many :team_projects, through: :team_boards

end
