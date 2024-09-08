class AddRatingToNeedRatings < ActiveRecord::Migration[7.1]
  def change
    add_column :need_ratings, :rating, :integer, default: 0
    remove_column :need_ratings, :title, :string
  end
end
