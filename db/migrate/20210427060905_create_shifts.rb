class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.date :date, null: false
      t.time :start_time, null: false
      t.time :end_time, null: false
      t.integer :type, default: 0, null: false
      t.integer :work, default: 0, null: false

      t.timestamps
    end
  end
end
