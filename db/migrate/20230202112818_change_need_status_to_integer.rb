class ChangeNeedStatusToInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column :needs, :status
    add_column :needs, :status, :integer, default: nil
  end
end
