class AddOwnerIdToAlerts < ActiveRecord::Migration
  def self.up
    add_column :alerts, :owner_id, :integer
    remove_column :alerts, :owner
  end
  def self.down
    remove_column :alerts, :owner_id
    add_column :alerts, :owner, :string
  end

end
