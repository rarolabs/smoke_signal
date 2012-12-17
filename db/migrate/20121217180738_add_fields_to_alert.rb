class AddFieldsToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :owner, :string
    add_column :alerts, :active, :boolean
  end
end
