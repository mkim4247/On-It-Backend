class CreateTeamTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :team_todos do |t|
      t.string :title
      t.string :description
      t.date :due_date
      t.integer :team_project_id
      t.timestamps
    end
  end
end
