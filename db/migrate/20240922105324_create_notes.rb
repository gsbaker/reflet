class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.references :therapy, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
