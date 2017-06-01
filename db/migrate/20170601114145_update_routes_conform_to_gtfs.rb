class UpdateRoutesConformToGtfs < ActiveRecord::Migration[5.0]
  def change
    rename_column :routes, :mode_name, :description
    rename_column :routes, :mode_id, :route_type
    rename_column :routes, :color, :route_color
    rename_column :routes, :url, :route_url
    add_column :routes, :agency_id, :integer
    add_column :routes, :route_text_color, :string
  end
end
