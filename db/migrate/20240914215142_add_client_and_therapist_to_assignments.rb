class AddClientAndTherapistToAssignments < ActiveRecord::Migration[7.1]
  def change
    add_column :assignments, :client_id, :integer
    add_column :assignments, :therapist_id, :integer

    add_foreign_key :assignments, :users, column: :client_id
    add_foreign_key :assignments, :users, column: :therapist_id
  end
end
