class RemoveUniquenessContractTherapistContract < ActiveRecord::Migration[8.0]
  def change
    remove_index :contracts, name: "index_contracts_on_therapist_id", unique: true
  end
end
