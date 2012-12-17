class CreateAlertTypes < ActiveRecord::Migration
  def change
    create_table :alert_types do |t|
      t.string :key
      t.string :title
      t.string :describe
      t.integer :system_id
      t.timestamps
    end
  end
end
