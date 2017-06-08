class RenameRoutesColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :routes, :long_name, :route_long_name
    rename_column :routes, :short_name, :route_short_name
  end
end
