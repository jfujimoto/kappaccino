class AddUserIdToScrims < ActiveRecord::Migration
  def change
    add_column :scrims, :user_id, :integer
    add_index :scrims, :user_id
  end
end
