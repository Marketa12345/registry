class AddSearchDogToWatch < ActiveRecord::Migration
  def change
    add_column :watches, :search_dog, :string
  end
end
