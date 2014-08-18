class Convert < ActiveRecord::Base
  belongs_to :user
  has_attached_file :download
  do_not_validate_attachment_file_type :download
end
