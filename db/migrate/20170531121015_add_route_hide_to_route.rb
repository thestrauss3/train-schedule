class AddRouteHideToRoute < ActiveRecord::Migration[5.0]
  def change
    add_column :routes, :route_hide, :boolean, default: false
  end
end
