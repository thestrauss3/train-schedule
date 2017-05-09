class RemoveAssociations < ActiveRecord::Migration[5.0]
  def up
    remove_column :user_favorite_stations, :station_id
    remove_column :user_favorite_lines, :train_line_id
    remove_column :user_favorite_trains, :train_id
  end

  def down
    change_table :user_favorite_trains do |t|
      t.belongs_to :train
    end
    change_table :user_favorite_stations do |t|
      t.belongs_to :station
    end
    change_table :user_favorite_lines do |t|
      t.belongs_to :train_line
    end
  end
end
