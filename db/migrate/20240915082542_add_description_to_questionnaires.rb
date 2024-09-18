class AddDescriptionToQuestionnaires < ActiveRecord::Migration[7.1]
  def change
    add_column :questionnaires, :description, :text
  end
end
