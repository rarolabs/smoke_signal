class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :system
      t.string :key
      t.string :valor
      t.string :data_type

      t.timestamps
    end
  end
end
