class CategoryDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :needs, :category, :string, default: 'Uncategorised'
    Need.all.each do |need|
      need.category = 'Uncategorised'
    end
  end
end
