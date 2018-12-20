class Site < ApplicationRecord
  belongs_to :category
  has_many :likes
  has_many :users, through: :likes
end
