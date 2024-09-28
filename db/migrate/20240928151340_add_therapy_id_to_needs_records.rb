class AddTherapyIdToNeedsRecords < ActiveRecord::Migration[7.1]
  def change
    add_column :needs_records, :therapy_id, :integer
    add_foreign_key :needs_records, :therapies
  end
end
