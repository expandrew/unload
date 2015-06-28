class Upload < ActiveRecord::Base
  has_attached_file :image,
    :storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
    :dropbox_options => {}

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end