class ChangeDataEndTimeToShifts < ActiveRecord::Migration[5.2]
  def change
    change_column :shifts, :end_time, :datetime
  end
end
