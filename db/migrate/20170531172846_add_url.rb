class AddUrl < ActiveRecord::Migration[5.0]
  def change
    add_column :routes, :url, :string
  end
end
