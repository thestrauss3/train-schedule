class CreateStopTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :stop_times do |t|
      t.string :trip_id, null: false
      t.string :arrival_time
      t.string :departure_time
      t.string :stop_id, null: false
      t.integer :stop_sequence, null: false
      t.string :stop_headsign
      t.integer :pickup_type, default: 0
      t.integer :drop_off_type, default: 0
      t.float :shape_dist_traveled
      t.integer :timepoint
    end
  end
end
