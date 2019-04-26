class UserBoard < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :user_projects, dependent: :destroy
  has_many :user_todos, through: :user_projects, dependent: :destroy

end
