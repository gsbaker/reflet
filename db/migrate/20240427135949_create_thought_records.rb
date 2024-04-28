class CreateThoughtRecords < ActiveRecord::Migration[7.1]
  def change
    create_table :thought_records do |t|
      t.string :alternative_thoughts
      t.string :alternative_feelings

      t.timestamps
    end
  end
end
