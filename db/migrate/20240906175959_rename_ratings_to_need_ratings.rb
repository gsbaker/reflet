class RenameRatingsToNeedRatings < ActiveRecord::Migration[7.1]
  def change
    rename_table :ratings, :need_ratings
  end
end
