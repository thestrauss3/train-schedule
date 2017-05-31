class AddModeIdToRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column :routes, :mode_id, :integer, null: false
  end
end
