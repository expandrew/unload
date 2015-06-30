class Upload < ActiveRecord::Base
  belongs_to :folder

  Paperclip.interpolates :folder_name do |attachment, style|
    attachment.instance.folder.name
  end

  has_attached_file :image,
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    path: ":folder_name/:filename"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end