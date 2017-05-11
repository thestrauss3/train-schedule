class ChangeTrainIdToTrainNumInFavorites < ActiveRecord::Migration[5.0]
  def change
    rename_column :user_favorite_trains, :train_id, :train_num
  end
end
