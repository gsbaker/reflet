class RemoveAssignmentFromQuestionnaires < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :questionnaires, :assignments
    remove_column :questionnaires, :assignment_id, :integer
  end
end
