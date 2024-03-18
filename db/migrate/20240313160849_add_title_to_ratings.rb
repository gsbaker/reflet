class AddTitleToRatings < ActiveRecord::Migration[7.1]
  def change
    add_column :ratings, :title, :string
  end
end
