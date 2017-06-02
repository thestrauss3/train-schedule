class CreateFrequencies < ActiveRecord::Migration[5.0]
  def change
    create_table :frequencies do |t|
      t.string :trip_id, null: false
      t.string :start_time, null: false
      t.string :end_time, null: false
      t.string :headway_secs, null: false
      t.boolean :exact_times, default: false, null: false
    end
  end
end
