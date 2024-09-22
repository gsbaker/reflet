class RemoveCompletedAtFromQuestionnaires < ActiveRecord::Migration[7.1]
  def change
    remove_column :questionnaires, :completed_at, :datetime
  end
end
