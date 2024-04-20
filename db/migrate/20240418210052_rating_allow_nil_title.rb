class RatingAllowNilTitle < ActiveRecord::Migration[7.1]
  def change
    change_column_null :ratings, :title, true
  end
end
