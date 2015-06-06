class CreateUploadUrls < ActiveRecord::Migration
  def change
    create_table :upload_urls do |t|
      t.string :code
      t.references :folder, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :upload_urls, :code, unique: true
  end
end
