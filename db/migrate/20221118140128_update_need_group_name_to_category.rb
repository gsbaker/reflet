class UpdateNeedGroupNameToCategory < ActiveRecord::Migration[7.0]
  def change
    rename_column :needs, :group, :category
  end
end
