class ThoughtRecordTitleNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :thought_records, :title, false
  end
end
