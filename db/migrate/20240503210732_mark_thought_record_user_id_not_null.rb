class MarkThoughtRecordUserIdNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :thought_records, :user_id, false
  end
end
