class CreateConverts < ActiveRecord::Migration
  def change
    create_table :converts do |t|
      t.string :download
      t.references :User, index: true

      t.timestamps
    end
  end
end
