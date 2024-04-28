class UpdateAllThoughtRecordColumnsToRichText < ActiveRecord::Migration[7.1]
  def change
    remove_column :thought_records, :alternative_thoughts
    remove_column :thought_records, :alternative_feelings
  end
end
