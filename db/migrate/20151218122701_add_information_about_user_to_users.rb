class AddInformationAboutUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :street, :string
    add_column :users, :zip_code, :integer
    add_column :users, :psc, :integer
    add_column :users, :city, :string
  end
end
