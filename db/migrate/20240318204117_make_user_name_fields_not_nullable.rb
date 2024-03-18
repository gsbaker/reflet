class MakeUserNameFieldsNotNullable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :users, :forename, false
    change_column_null :users, :surname, false
  end
end
