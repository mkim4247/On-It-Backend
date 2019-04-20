class CreateTeamProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :team_projects do |t|
      t.string :name
      t.string :description
      t.integer :team_board_id 
      t.timestamps
    end
  end
end
