class User < ApplicationRecord
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :username, uniqueness: { case_sensitive: false }

  has_many :user_teams, dependent: :destroy
  has_many :teams, through: :user_teams
  has_many :team_boards, through: :teams
  has_many :team_projects, through: :team_boards
  has_many :user_team_todos, dependent: :destroy
  has_many :team_todos, through: :user_team_todos

  has_many :user_boards, dependent: :destroy
  has_many :user_projects, through: :user_boards
  has_many :user_todos, through: :user_projects

end
