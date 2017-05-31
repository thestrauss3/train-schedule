class RemoveHasWifiFromStations < ActiveRecord::Migration[5.0]
  def up
    remove_column :stations, :has_wifi
  end
  def down
    add_column :stations, :has_wifi, :boolean
  end
end
