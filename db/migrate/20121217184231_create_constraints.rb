class CreateConstraints < ActiveRecord::Migration
  def change
    create_table :constraints do |t|
      t.string :field_name
      t.string :value
      t.integer :alert_type_id
      t.timestamps
    end
  end
end
