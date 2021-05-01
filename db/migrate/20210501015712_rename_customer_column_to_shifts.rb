class RenameCustomerColumnToShifts < ActiveRecord::Migration[5.2]
  def change
    rename_column :shifts, :customer, :customer_na
  end
end
