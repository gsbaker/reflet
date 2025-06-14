class AddContractAcceptedAtToInvitations < ActiveRecord::Migration[8.0]
  def change
    add_column :invitations, :contract_accepted_at, :datetime, null: true
  end
end
