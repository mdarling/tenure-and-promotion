class CreateSignIns < ActiveRecord::Migration
  def change
    create_table :sign_ins do |t|

      t.timestamps
    end
  end
end
