class CreateTrains < ActiveRecord::Migration[5.0]
  def change
    create_table :trains do |t|
      t.integer :train_num, null: false
      t.belongs_to :train_line
      t.boolean :inbound

      t.timestamps
    end
  end
end
