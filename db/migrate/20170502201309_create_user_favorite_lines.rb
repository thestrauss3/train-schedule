class CreateUserFavoriteLines < ActiveRecord::Migration[5.0]
  def change
    create_table :user_favorite_lines do |t|
      t.belongs_to :user, null: false
      t.belongs_to :train_line, null: false

      t.timestamps
    end
  end
end
