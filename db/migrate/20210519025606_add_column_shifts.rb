class AddColumnShifts < ActiveRecord::Migration[5.2]
  def change
    add_column :shifts, :status, :integer, default: 0
  end
end
