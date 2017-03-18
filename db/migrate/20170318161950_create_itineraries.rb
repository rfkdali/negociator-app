class CreateItineraries < ActiveRecord::Migration[5.0]
  def change
    create_table :itineraries do |t|
      t.float :origin_latitude
      t.float :origin_longitude
      t.float :destination_latitude
      t.float :destination_longitude
      t.datetime :start_time

      t.timestamps
    end
  end
end
