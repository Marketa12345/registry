class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :surname
      t.string :street
      t.integer :street_number
      t.integer :zip_code
      t.string :city

      t.timestamps null: false
    end
  end
end
