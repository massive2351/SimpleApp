class ChangeDataStartTimeToShifts < ActiveRecord::Migration[5.2]
  def change
    change_column :shifts, :start_time, :datetime
  end
end
