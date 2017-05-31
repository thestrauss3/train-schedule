class RemoveTripsInboundProperty < ActiveRecord::Migration[5.0]
  def up
    remove_column :trips, :inbound
  end
  def down
    add_column :trips, :inbound, :boolean
  end
end
