class AdjustRoutesSettings < ActiveRecord::Migration[5.0]
  def up
    change_column :routes, :short_name, :string, null: false
    change_column :routes, :mode_name, :string
  end
  def down
    change_column :routes, :short_name, :string
    change_column :routes, :mode_name, :string, null: false
  end
end
