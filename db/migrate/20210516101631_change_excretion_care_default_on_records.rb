class ChangeExcretionCareDefaultOnRecords < ActiveRecord::Migration[5.2]
  def change
    change_column_default :records, :excretion_care, from: "", to: nil
  end
end
