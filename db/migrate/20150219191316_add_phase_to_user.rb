class AddPhaseToUser < ActiveRecord::Migration
  def change
    add_column :users, :phase, :integer, default: 0
  end
end
