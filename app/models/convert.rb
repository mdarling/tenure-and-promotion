class Convert < ActiveRecord::Base
  belongs_to :category
  belongs_to :upload
  #This is for the downloads from CloudConvert
  has_attached_file :download
  #Don't validate file type, it will be PDF anyway.
  do_not_validate_attachment_file_type :download
end
