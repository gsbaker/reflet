class NeedsRecordsStatusDefaultNull < ActiveRecord::Migration[7.1]
  def change
    change_column :needs_records, :status, :integer, null: true, default: nil
  end
end
