class CreateUserBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :user_boards do |t|
      t.string :name
      t.string :description
      t.string :background_image
      t.integer :user_id
      t.timestamps
    end
  end
end
