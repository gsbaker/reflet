class AddTitleToNeedsRecords < ActiveRecord::Migration[8.0]
  def change
    add_column :needs_records, :title, :string, null: false
  end
end
