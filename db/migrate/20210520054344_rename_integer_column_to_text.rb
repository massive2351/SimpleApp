class RenameIntegerColumnToText < ActiveRecord::Migration[5.2]
  def change
    change_column :records, :clean_care, :text
    change_column :records, :move_care, :text
  end
end
