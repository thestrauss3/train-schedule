class CreateStations < ActiveRecord::Migration[5.0]
  def change
    create_table :stations do |t|
      t.string :name, null: false
      t.belongs_to :train_line
      t.boolean :has_wifi

      t.timestamps
    end
  end
end
