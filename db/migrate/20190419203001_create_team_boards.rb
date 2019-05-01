class CreateTeamBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :team_boards do |t|
      t.string :name
      t.string :description
      t.string :background_image
      t.integer :team_id
      t.timestamps
    end
  end
end
