class AddContractIdToInvitations < ActiveRecord::Migration[8.0]
  def change
    add_column :invitations, :contract_id, :integer, null: true
  end
end
