class AddStatusToShiftStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :shift_statuses, :status, :integer, default: 0
  end
end
