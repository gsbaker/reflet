class AddQuestionnaireIdToAssignments < ActiveRecord::Migration[7.1]
  def change
    add_column :assignments, :questionnaire_id, :integer
  end
end
