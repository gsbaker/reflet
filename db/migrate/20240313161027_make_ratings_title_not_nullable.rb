class MakeRatingsTitleNotNullable < ActiveRecord::Migration[7.1]
  def change
    change_column_null :ratings, :title, false
  end
end
