class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :address, :text
    add_column :users, :gender, :string
    add_column :users, :security, :string
    add_column :users, :status, :string
    add_column :users, :subscribe, :boolean
    add_column :users, :zip, :string
    add_column :users, :dob, :datetime
  end
end
