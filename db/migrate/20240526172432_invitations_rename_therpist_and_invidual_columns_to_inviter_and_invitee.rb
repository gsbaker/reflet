class InvitationsRenameTherpistAndInvidualColumnsToInviterAndInvitee < ActiveRecord::Migration[7.1]
  def change
    rename_column :invitations, :therapist_id, :inviter_id
    rename_column :invitations, :individual_id, :invitee_id
  end
end
