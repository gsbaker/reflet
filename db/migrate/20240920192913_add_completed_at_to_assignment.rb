class AddCompletedAtToAssignment < ActiveRecord::Migration[7.1]
  def change
    add_column :assignments, :completed_at, :datetime
  end
end
