class CreateUserFavoriteTrains < ActiveRecord::Migration[5.0]
  def change
    create_table :user_favorite_trains do |t|
      t.belongs_to :user, null: false
      t.belongs_to :train, null: false

      t.timestamps
    end
  end
end
