class UpdateAndAddColumnsStations < ActiveRecord::Migration[5.0]
  def change
    rename_column :stations, :name, :stop_name
    rename_column :stations, :train_line_id, :route_id
    add_column :stations, :stop_order, :integer, null: false
    add_column :stations, :stop_id, :string, null: false
    add_column :stations, :parent_stop_id, :string
    add_column :stations, :parent_stop_name, :string
    add_column :stations, :stop_lat, :float
    add_column :stations, :stop_lon, :float
    add_column :stations, :direction_id, :integer
    add_column :stations, :direction_name, :string
    add_column :stations, :route_name, :string
  end
end
