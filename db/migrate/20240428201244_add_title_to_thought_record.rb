class AddTitleToThoughtRecord < ActiveRecord::Migration[7.1]
  def change
    add_column :thought_records, :title, :string
  end
end
