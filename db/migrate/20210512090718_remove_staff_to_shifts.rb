class RemoveStaffToShifts < ActiveRecord::Migration[5.2]
  def change
    remove_column :shifts, :staff, :string
    remove_column :shifts, :customer_na, :string
  end
end
