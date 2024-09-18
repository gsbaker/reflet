class RemoveQuestionnaireIdFromAssignments < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :assignments, :questionnaires
    remove_column :assignments, :questionnaire_id, :integer
  end
end
