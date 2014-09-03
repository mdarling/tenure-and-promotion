class Upload < ActiveRecord::Base
belongs_to :user
has_many :Uploads, dependent: :destroy
  has_attached_file :upload
  do_not_validate_attachment_file_type :upload

  include Rails.application.routes.url_helpers
  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
#      "delete_url" => upload_path(user_id,self),
      "delete_url" => upload_path(self,@user.id),
      "delete_type" => "DELETE"
    }
  end

end
