class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :subject_id
      t.string :image

      t.timestamps null: false
    end

    add_index :images, :subject_id
  end
end
