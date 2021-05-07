class AddExcretionCareToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :excretion_care, :text
  end
end
