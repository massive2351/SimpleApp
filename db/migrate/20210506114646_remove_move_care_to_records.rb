class RemoveMoveCareToRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :records, :move_care, :integer
  end
end
