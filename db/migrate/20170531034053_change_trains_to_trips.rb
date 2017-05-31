class ChangeTrainsToTrips < ActiveRecord::Migration[5.0]
  def change
    rename_table :trains, :trips
  end
end
