class ChangeNeedRatingsStatusDefaultToNil < ActiveRecord::Migration[7.1]
  def change
    change_column :need_ratings, :status, :integer, default: nil
  end
end
