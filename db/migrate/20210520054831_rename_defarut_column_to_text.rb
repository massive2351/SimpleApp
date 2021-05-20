class RenameDefarutColumnToText < ActiveRecord::Migration[5.2]
  def change
    change_column_default :records, :move_care, from: "", to: nil
    change_column_default :records, :clean_care, from: "", to: nil
  end
end
