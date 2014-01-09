class CreateScrims < ActiveRecord::Migration
  def change
    create_table :scrims do |t|
      t.string :player
      t.integer :mmr
      t.string :location

      t.timestamps
    end
  end
end
