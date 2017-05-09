class AddFavoriteColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :user_favorite_stations, :station_id, :string
    add_column :user_favorite_trains, :train_id, :string
    add_column :user_favorite_lines, :line_id, :string
  end
end
