class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|
      t.references :therapist, null: false, foreign_key: { to_table: :users }
      t.references :user, null: false, foreign_key: true
      t.string :status, null: false, default: "sent"

      t.timestamps
    end
  end
end
