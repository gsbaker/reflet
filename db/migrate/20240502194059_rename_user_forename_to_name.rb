class RenameUserForenameToName < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :forename, :name
  end
end
