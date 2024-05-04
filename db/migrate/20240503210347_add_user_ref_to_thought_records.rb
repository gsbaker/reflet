class AddUserRefToThoughtRecords < ActiveRecord::Migration[7.1]
  def change
    add_reference :thought_records, :user, foreign_key: true
  end
end
