class User < ApplicationRecord
  has_many :user_categories
  has_many :categories, through: :user_categories
  has_many :likes
  has_many :sites, through: :likes
end
