class AddMoveCareToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :move_care, :text
  end
end
