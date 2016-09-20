class AddBackupIdToVitolas < ActiveRecord::Migration[5.0]
  def change
    add_column :vitolas, :backup_id, :integer
  end
end
