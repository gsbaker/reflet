class RemoveUserSurnameColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :surname, :string
  end
end
