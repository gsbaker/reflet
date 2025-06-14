class CreateContracts < ActiveRecord::Migration[8.0]
  def change
    create_table :contracts do |t|
      t.integer :therapist_id

      t.timestamps
    end
    add_index :contracts, :therapist_id, unique: true
  end
end
