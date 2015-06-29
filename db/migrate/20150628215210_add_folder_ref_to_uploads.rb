class AddFolderRefToUploads < ActiveRecord::Migration
  def change
    add_reference :uploads, :folder, index: true, foreign_key: true
  end
end
