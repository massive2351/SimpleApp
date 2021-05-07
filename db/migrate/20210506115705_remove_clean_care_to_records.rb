class RemoveCleanCareToRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :records, :clean_care, :integer
  end
end
