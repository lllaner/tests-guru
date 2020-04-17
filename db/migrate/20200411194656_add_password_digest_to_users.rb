class AddPasswordDigestToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_digest, :string
    change_column :users, :email, :string, null: false, unique: true
  end
end
