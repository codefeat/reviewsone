class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.string :window

      t.timestamps null: false
    end
  end
end
