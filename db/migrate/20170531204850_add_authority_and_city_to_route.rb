class AddAuthorityAndCityToRoute < ActiveRecord::Migration[5.0]
  def change
    add_column :routes, :authority, :string, null: false
    add_column :routes, :city, :string, null: false
  end
end
