class Upload < ActiveRecord::Base
  belongs_to :category
  has_attached_file :upload
  #Don't check the attachment type, it could be anything!
  do_not_validate_attachment_file_type :upload

  include Rails.application.routes.url_helpers
  #Adds simple attributes to the uploaded file
  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "delete_url" => category_upload_path(category_id,self),
      "delete_type" => "DELETE",
      "thumbnail_url" => "/assets/" + Icon.for_filename(upload_file_name)
    }
  end
end
