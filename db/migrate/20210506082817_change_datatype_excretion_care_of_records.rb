class ChangeDatatypeExcretionCareOfRecords < ActiveRecord::Migration[5.2]
  def change
    change_column :records, :excretion_care, :text
  end
end
