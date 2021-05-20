class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.integer :shift_id
      t.integer :face, default: 0
      t.integer :sewat, default: 0
      t.string :body_temperature
      t.integer :excretion_care
      t.string :urinate
      t.string :evacuate
      t.string :meal_care
      t.integer :bath_care, default: 0
      t.integer :move_care
      t.integer :clean_care
      t.string :cooking_care
      t.string :buy_care
      t.text :content

      t.timestamps
    end
  end
end
