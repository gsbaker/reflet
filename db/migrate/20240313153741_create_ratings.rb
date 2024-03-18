class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
      t.references :report, null: false, foreign_key: true
      t.references :need, null: false, foreign_key: true

      t.timestamps
    end
  end
end
