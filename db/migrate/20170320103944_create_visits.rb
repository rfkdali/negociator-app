class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visits do |t|
      t.float :duration
      t.string :address
      t.datetime :arrival_time
      t.belongs_to :itinerary, foreign_key: true

      t.timestamps
    end
  end
end
