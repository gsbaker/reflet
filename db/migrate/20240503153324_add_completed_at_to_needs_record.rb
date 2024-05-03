class AddCompletedAtToNeedsRecord < ActiveRecord::Migration[7.1]
  def change
    add_column :needs_records, :completed_at, :datetime
  end
end
