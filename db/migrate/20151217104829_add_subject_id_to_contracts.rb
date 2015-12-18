class AddSubjectIdToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :subject_id, :integer
    add_index :contracts, :subject_id
  end
end
