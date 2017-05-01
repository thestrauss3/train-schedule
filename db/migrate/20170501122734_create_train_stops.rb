class CreateTrainStops < ActiveRecord::Migration[5.0]
  def change
    create_table :train_stops do |t|
      t.belongs_to :train, null: false
      t.belongs_to :station, null: false
      t.time :stop_time, null: false

      t.timestamps
    end
  end
end
