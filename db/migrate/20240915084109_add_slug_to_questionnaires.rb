class AddSlugToQuestionnaires < ActiveRecord::Migration[7.1]
  def change
    add_column :questionnaires, :slug, :string
    add_index :questionnaires, :slug, unique: true
  end
end
