class RemoveCityAndAuthorityFromRoutes < ActiveRecord::Migration[5.0]
  def up
    remove_column :routes, :city
    remove_column :routes, :authority
  end
  def down
    add_column :routes, :city, :string, null: false
    add_column :routes, :authority, :string, null: false
  end
end
