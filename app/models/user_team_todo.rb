class UserTeamTodo < ApplicationRecord
  belongs_to :user
  belongs_to :team_todo
  
end
