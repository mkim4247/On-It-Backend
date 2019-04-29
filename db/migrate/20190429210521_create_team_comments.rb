class CreateTeamComments < ActiveRecord::Migration[5.2]
  def change
    create_table :team_comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :team_project_id
      t.timestamps
    end
  end
end
