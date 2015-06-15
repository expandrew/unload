class AddUploadCodeToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :upload_code, :string
    add_index :folders, :upload_code

    drop_table :upload_urls
  end
end
