class UserComment < ApplicationRecord
  belongs_to :user
  belongs_to :user_project
  
end
