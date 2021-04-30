class AddStaffToShifts < ActiveRecord::Migration[5.2]
  def change
    add_column :shifts, :staff, :string
  end
end
