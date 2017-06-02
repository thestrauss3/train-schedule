class CreateStops < ActiveRecord::Migration[5.0]
  def change
    create_table :stops do |t|
      t.string :stop_id, null: false
      t.string :stop_code
      t.string :stop_name, null: false
      t.text :stop_desc
      t.decimal :stop_lat, null: false
      t.decimal :stop_lon, null: false
      t.string :zone_id
      t.string :stop_url
      t.integer :location_type
      t.string :parent_station
      t.string :stop_timezone
      t.integer :wheelchair_boarding
    end
  end
end
