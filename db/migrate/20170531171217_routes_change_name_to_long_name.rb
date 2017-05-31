class RoutesChangeNameToLongName < ActiveRecord::Migration[5.0]
  def change
    rename_column :routes, :name, :long_name
  end
end
