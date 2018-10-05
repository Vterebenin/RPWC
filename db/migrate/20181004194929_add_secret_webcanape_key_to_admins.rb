class AddSecretWebcanapeKeyToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :secret_webcanape_key, :string
  end
end
