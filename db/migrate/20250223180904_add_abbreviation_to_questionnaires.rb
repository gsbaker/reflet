class AddAbbreviationToQuestionnaires < ActiveRecord::Migration[8.0]
  def change
    add_column :questionnaires, :abbreviation, :string
  end
end
