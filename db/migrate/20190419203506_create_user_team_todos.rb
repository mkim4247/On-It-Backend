class CreateUserTeamTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_team_todos do |t|
      t.integer :user_id
      t.integer :team_todo_id
      t.timestamps
    end
  end
end
