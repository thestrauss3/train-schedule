class CreateUserFavoriteStations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_favorite_stations do |t|
      t.belongs_to :user, null: false
      t.belongs_to :station, null: false

      t.timestamps
    end
  end
end
