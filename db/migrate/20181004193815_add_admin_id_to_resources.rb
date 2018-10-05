class AddAdminIdToResources < ActiveRecord::Migration[5.2]
  def change
    add_column :resources, :admin_id, :integer
  end
end
