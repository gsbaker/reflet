class MarkTitleColumnNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :questions, :title, false
    change_column_null :questionnaires, :title, false
  end
end
