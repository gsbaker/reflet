class ChangeNeedCategoryColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :needs, :category, :status
  end
end
