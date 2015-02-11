class AddUploadToConverts < ActiveRecord::Migration
  def change
    add_reference :converts, :upload, index: true
    add_foreign_key :converts, :uploads
  end
end
