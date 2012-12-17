class ChangeDescribeToDescriptionInAlertType < ActiveRecord::Migration
  def up
    rename_column :alert_types, :describe, :description
  end

  def down
    rename_column :alert_types, :description, :describe
  end
end
