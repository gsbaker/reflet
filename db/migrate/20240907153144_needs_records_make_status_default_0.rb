class NeedsRecordsMakeStatusDefault0 < ActiveRecord::Migration[7.1]
  def change
    change_column :needs_records, :status, :integer, default: 0
  end
end
