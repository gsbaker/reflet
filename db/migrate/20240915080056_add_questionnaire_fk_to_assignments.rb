class AddQuestionnaireFkToAssignments < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :assignments, :questionnaires
  end
end
