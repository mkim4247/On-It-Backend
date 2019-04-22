class UserProject < ApplicationRecord
  validates :name, presence: true

  belongs_to :user_board
  has_many :user_todos

end