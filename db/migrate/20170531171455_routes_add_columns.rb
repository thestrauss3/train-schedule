class RoutesAddColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :routes, :short_name, :string
    add_column :routes, :color, :string
  end
end
