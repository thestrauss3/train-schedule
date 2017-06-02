class CreateShapes < ActiveRecord::Migration[5.0]
  def change
    create_table :shapes do |t|
      t.string :shape_id, null: false
      t.decimal :shape_pt_lat, null: false
      t.decimal :shape_pt_lon, null: false
      t.integer :shape_pt_sequence, null: false
      t.float :shape_dist_traveled
    end
  end
end
