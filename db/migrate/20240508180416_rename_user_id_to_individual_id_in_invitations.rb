class RenameUserIdToIndividualIdInInvitations < ActiveRecord::Migration[7.1]
  def change
    rename_column :invitations, :user_id, :individual_id
  end
end
