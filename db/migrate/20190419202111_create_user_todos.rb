class CreateUserTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_todos do |t|
      t.integer :display_order
      t.string :title
      t.string :description
      t.date :due_date
      t.integer :user_project_id
      t.timestamps
    end
  end
end
