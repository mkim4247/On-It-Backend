class CreateUserComments < ActiveRecord::Migration[5.2]
  def change
    create_table :user_comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :user_project_id
      t.timestamps
    end
  end
end
