class RenameColumnsInTrips < ActiveRecord::Migration[5.0]
  def change
    rename_column :trips, :train_num, :trip_name
    rename_column :trips, :train_line_id, :route_id
  end
end
