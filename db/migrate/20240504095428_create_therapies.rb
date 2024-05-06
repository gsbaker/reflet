class CreateTherapies < ActiveRecord::Migration[7.1]
  def change
    create_table :therapies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :therapist, null: false, foreign_key: { to_table: :users }
      t.datetime :started_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
