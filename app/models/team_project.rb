class TeamProject < ApplicationRecord
  validates :name, presence: true

  belongs_to :team_board
  has_many :team_todos

end
