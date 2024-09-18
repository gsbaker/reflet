class RemoveTherapistAndClientFromAssignments < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :assignments, :users, column: :therapist_id
    remove_foreign_key :assignments, :users, column: :client_id
    remove_column :assignments, :therapist_id, :integer
    remove_column :assignments, :client_id, :integer
  end
end
