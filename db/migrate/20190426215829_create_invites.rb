class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.string :email
      t.integer :team_id
      t.integer :sender_id
      t.integer :receiver_id
      t.timestamps
    end
  end
end
