class CreateConverts < ActiveRecord::Migration
  def change
    create_table :converts do |t|
      t.string :cid
      t.string :url
      t.string :step

      t.timestamps
    end
  end
end
