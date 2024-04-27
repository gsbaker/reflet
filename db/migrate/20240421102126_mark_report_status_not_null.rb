class MarkReportStatusNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :reports, :status, false
  end
end
