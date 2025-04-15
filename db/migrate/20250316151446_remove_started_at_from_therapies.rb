class RemoveStartedAtFromTherapies < ActiveRecord::Migration[8.0]
  def change
    remove_column :therapies, :started_at, :datetime
  end
end
