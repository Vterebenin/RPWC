class AddCategoryIdToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :category_id, :integer
  end
end
