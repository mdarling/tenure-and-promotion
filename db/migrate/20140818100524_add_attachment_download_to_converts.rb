class AddAttachmentDownloadToConverts < ActiveRecord::Migration
  def self.up
    change_table :converts do |t|
      t.attachment :download
    end
  end

  def self.down
    remove_attachment :converts, :download
  end
end
