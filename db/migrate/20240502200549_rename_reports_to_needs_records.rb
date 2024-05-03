class RenameReportsToNeedsRecords < ActiveRecord::Migration[7.1]
  def change
    rename_table :reports, :needs_records
  end
end
