class RenameRatingsReportIdToNeedsRecordId < ActiveRecord::Migration[7.1]
  def change
    rename_column :ratings, :report_id, :needs_record_id
  end
end
