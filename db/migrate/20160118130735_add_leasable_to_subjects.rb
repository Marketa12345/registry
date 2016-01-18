class AddLeasableToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :leasable, :boolean, default: false
  end
end
