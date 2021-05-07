class RemoveExcretionCareToRecords < ActiveRecord::Migration[5.2]
  def change
    remove_column :reco, :user_id, :string
  end
end
