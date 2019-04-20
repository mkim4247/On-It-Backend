class UserBoard < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :user_projects
  has_many :user_todos, through: :user_projects

end
