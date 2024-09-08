class NeedsRecordChangeStatusToEnum < ActiveRecord::Migration[7.1]
  def change
    remove_column :needs_records, :status, :string
    add_column :needs_records, :status, :integer, default: 0
  end
end
