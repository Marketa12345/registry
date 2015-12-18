class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.date :date_from
      t.date :date_to
      t.text :description

      t.timestamps null: false
    end
  end
end
