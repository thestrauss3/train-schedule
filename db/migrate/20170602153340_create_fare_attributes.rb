class CreateFareAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :fare_attributes do |t|
      t.string :fare_id, null: false
      t.float :price, null: false
      t.string :currency_type, null: false
      t.integer :payment_method, null: false
      t.integer :transfers, null: false
      t.integer :transfer_duration
    end
  end
end
