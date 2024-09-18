class AddAssignableIdAndTypeToAssignments < ActiveRecord::Migration[7.1]
  def change
    add_column :assignments, :assignable_id, :integer
    add_column :assignments, :assignable_type, :string

    add_index :assignments, [:assignable_id, :assignable_type]
  end
end
