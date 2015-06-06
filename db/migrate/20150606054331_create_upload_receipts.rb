class CreateUploadReceipts < ActiveRecord::Migration
  def change
    create_table :upload_receipts do |t|
      t.string :file_name
      t.references :folder, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
