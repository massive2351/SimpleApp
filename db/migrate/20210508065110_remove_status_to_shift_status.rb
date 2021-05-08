class RemoveStatusToShiftStatus < ActiveRecord::Migration[5.2]
  def change
    remove_column :shift_statuses, :status, :integer
  end
end
