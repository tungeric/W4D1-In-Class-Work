class AddColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, null: false
    add_column :users, :password, :string, null: false
  end
end
