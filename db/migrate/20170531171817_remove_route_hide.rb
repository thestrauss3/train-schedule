class RemoveRouteHide < ActiveRecord::Migration[5.0]
  def up
    remove_column :routes, :route_hide
  end
  def down
    add_column :routes, :route_hide, :boolean, default: false
  end
end
