class AddIdsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :sender_id, :integer
    add_column :contacts, :recipient_id, :integer
    add_column :contacts, :subject_id, :integer
  end
end
