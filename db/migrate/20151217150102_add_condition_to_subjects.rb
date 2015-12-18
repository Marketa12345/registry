class AddConditionToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :is_public2, :boolean
  end
end
