class CreateTrips < ActiveRecord::Migration[5.0]
  def up
    drop_table :trips
    create_table :trips do |t|
      t.string :route_id, null: false
      t.string :service_id, null: false
      t.string :trip_id, null: false
      t.string :trip_headsign
      t.string :trip_short_name
      t.integer :direction_id
      t.string :block_id
      t.string :shape_id
      t.integer :wheelchair_accessible
      t.integer :bikes_allowed
    end
  end
  def down
    drop_table :trips
    create_table :trips do |t|
      t.integer :trip_name, null: false
      t.string :route_id, null: false
      t.string :trip_id, null: false
      t.string :route_name, null: false
      t.integer :direction_id, null: false
      t.string :direction_name, null: false
      t.string :route_type, null: false
      t.string :mode_name, null: false

      t.timestamps
      t.index ["route_id"], name: "index_trips_on_route_id", using: :btree
    end
  end
end
