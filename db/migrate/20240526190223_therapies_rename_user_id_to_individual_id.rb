class TherapiesRenameUserIdToIndividualId < ActiveRecord::Migration[7.1]
  def change
    rename_column :therapies, :user_id, :individual_id
  end
end
