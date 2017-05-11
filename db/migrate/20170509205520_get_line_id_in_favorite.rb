class GetLineIdInFavorite < ActiveRecord::Migration[5.0]
  def change
    add_column :user_favorite_stations, :line_id, :string, null: false
    add_column :user_favorite_trains, :line_id, :string, null: false
  end
end
