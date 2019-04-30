class TeamProject < ApplicationRecord
  validates :name, presence: true

  belongs_to :team_board
  has_many :team_todos, dependent: :destroy
  has_many :team_comments, dependent: :destroy
end
