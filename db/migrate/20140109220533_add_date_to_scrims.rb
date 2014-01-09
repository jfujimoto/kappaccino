class AddDateToScrims < ActiveRecord::Migration
  def change
    add_column :scrims, :date, :date
  end
end
