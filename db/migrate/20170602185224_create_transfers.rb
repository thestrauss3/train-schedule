class CreateTransfers < ActiveRecord::Migration[5.0]
  def change
    create_table :transfers do |t|
      t.string :from_stop_id, null: false
      t.string :to_stop_id, null: false
      t.integer :transfer_type, null: false
      t.integer :min_transfer_time
    end
  end
end
