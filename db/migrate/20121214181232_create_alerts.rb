class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :operator
      t.string :limit
      t.string :list_mail
      t.integer :alert_type_id
      t.timestamps
    end
  end
end
