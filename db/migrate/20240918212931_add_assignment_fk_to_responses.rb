class AddAssignmentFkToResponses < ActiveRecord::Migration[7.1]
  def change
    add_column :responses, :assignment_id, :integer
    add_foreign_key :responses, :assignments
  end
end
