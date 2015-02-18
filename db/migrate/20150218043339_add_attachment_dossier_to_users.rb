class AddAttachmentDossierToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :dossier
    end
  end

  def self.down
    remove_attachment :users, :dossier
  end
end
