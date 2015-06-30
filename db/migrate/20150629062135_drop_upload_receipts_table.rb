class DropUploadReceiptsTable < ActiveRecord::Migration
  def up
    drop_table :upload_receipts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
