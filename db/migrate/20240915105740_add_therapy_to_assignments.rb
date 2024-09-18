class AddTherapyToAssignments < ActiveRecord::Migration[7.1]
  def change
    add_column :assignments, :therapy_id, :integer
    add_foreign_key :assignments, :therapies
  end
end
