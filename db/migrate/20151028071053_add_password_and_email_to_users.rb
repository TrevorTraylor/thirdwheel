class AddPasswordAndEmailToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :email, :string
  	add_column :users, :password, :digest
  end
end
