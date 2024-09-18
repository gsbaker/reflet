class MarkAssignmentsClientIdAndTherpistIdAsNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :assignments, :client_id, false
    change_column_null :assignments, :therapist_id, false
  end
end
