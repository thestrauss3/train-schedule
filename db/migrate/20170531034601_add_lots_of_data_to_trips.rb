class AddLotsOfDataToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :trip_id, :string, null: false
    add_column :trips, :route_name, :string, null: false
    add_column :trips, :direction_id, :integer, null: false
    add_column :trips, :direction_name, :string, null: false
    add_column :trips, :route_type, :string, null: false
    add_column :trips, :mode_name, :string, null: false
  end
end
