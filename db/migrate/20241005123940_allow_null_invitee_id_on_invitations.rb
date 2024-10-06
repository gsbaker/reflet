class AllowNullInviteeIdOnInvitations < ActiveRecord::Migration[7.1]
  def change
    change_column_null :invitations, :invitee_id, true
  end
end
