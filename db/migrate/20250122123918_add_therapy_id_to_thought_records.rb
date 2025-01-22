class AddTherapyIdToThoughtRecords < ActiveRecord::Migration[8.0]
  def change
    add_column :thought_records, :therapy_id, :integer
    add_foreign_key :thought_records, :therapies
  end
end
