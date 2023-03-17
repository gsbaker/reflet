class RemoveUserFromNeed < ActiveRecord::Migration[7.0]
  def change
    remove_column :needs, :status
    remove_column :needs, :user_id
  end
end
