class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.attachment :image

      t.timestamps null: false
    end
  end
end
