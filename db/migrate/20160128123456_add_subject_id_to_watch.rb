class AddSubjectIdToWatch < ActiveRecord::Migration
  def change
    add_column :watches, :subject_id, :integer
  end
end
