class Upload < ActiveRecord::Base
attr_accessor :upload_file_name
@x = 5
  has_attached_file(
    :upload,
    :path => ":rails_root/public/:filename"
)
  do_not_validate_attachment_file_type :upload

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "delete_url" => upload_path(self),
      "delete_type" => "DELETE" 
    }
  end

end