class AddCustomerIdToShifts < ActiveRecord::Migration[5.2]
  def change
    add_column :shifts, :customer_id, :integer
    add_column :shifts, :customer, :string
  end
end
