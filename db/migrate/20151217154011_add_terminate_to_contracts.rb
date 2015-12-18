class AddTerminateToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :terminate, :boolean, default: false
  end
end
