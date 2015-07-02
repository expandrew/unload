class Folder < ActiveRecord::Base
  has_many :uploads, dependent: :destroy
  has_many :upload_receipts
  validates_presence_of :name
end
