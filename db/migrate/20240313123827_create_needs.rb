class CreateNeeds < ActiveRecord::Migration[7.1]
  def change
    create_table :needs do |t|
      t.string :title
      t.string :category

      t.timestamps
    end
  end
end
