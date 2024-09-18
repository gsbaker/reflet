class AddCadenceToAssignments < ActiveRecord::Migration[7.1]
  def change
    add_column :assignments, :cadence, :integer, default: 0
  end
end
