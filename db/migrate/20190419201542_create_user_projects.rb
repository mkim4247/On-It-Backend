class CreateUserProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_projects do |t|
      t.string :name
      t.string :description
      t.integer :user_board_id
      t.timestamps
    end
  end
end
