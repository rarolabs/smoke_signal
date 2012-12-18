class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.text :text
      t.string :message_type
      t.integer :alert_type_id
      t.timestamps
    end
  end
end
