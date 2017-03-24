class CreateItineraries < ActiveRecord::Migration[5.0]
  def change
    create_table :itineraries do |t|
      t.string :origin_address
      t.string :last_visit_address
      t.datetime :start_time
      t.datetime :arrival_time

      t.timestamps
    end
  end
end
