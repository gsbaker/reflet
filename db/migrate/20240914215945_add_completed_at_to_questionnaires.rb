class AddCompletedAtToQuestionnaires < ActiveRecord::Migration[7.1]
  def change
    add_column :questionnaires, :completed_at, :datetime
  end
end
