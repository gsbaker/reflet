class NeedRatingsRenameRatingToStatus < ActiveRecord::Migration[7.1]
  def change
    rename_column :need_ratings, :rating, :status
  end
end
