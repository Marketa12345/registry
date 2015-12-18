class AddConditionToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :is_public, :boolean
  end
end
