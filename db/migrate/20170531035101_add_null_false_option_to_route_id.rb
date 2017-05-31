class AddNullFalseOptionToRouteId < ActiveRecord::Migration[5.0]
  def up
    change_column :trips, :route_id, :string, null: false
  end
  def down
    change_column :trips, :route_id, :string
  end
end
