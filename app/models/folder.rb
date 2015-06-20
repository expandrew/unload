class Folder < ActiveRecord::Base
  has_many :upload_receipts
  validates_presence_of :name
end
