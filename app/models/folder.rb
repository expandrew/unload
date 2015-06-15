class Folder < ActiveRecord::Base
  has_many :upload_receipts
end
