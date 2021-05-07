class AddCleanCareToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :clean_care, :text
  end
end
