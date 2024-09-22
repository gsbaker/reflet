class AddResponseOptionsToQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :questions, :response_options, :text
  end
end
