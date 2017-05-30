class ChangeStationsRouteIdFromIntToStr < ActiveRecord::Migration[5.0]
  def up
    change_column :stations, :route_id, :string
  end
  def down
    change_column :stations, :route_id, :integer
  end
end
